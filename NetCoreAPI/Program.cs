using Hangfire;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using NetCoreAPI.BL;
using NetCoreAPI.DAL.Concrete;
using NetCoreAPI.DAL.Repository;
using NetCoreAPI.Jobs;
using NetCoreAPI.Models;
using System.Text;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddScoped<Context>();
builder.Services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));

// HangFire
var hangfireConnectionString = "server=FARUK\\SQLEXPRESS;database=NETCoreFlutter;integrated security=true;Encrypt=False";
builder.Services.AddHangfire(x =>
{
    x.UseSqlServerStorage(hangfireConnectionString);
    RecurringJob.AddOrUpdate<Job>(j => j.DbControl(), "* * * * *");
});
builder.Services.AddHangfireServer();


// JWT TOKEN
var jwtSettings = builder.Configuration.GetSection("AppSettings").Get<JwtSettings>();
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(x =>
{
    x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = jwtSettings.ApiBaseUrl,
        ValidAudience = jwtSettings.ApiBaseUrl,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings.SecretKey)),
    };
});

builder.Services.AddCors(x =>
{
    x.AddPolicy("AllowSpecificOrigin", builder =>
    {
        builder.WithOrigins(jwtSettings.ApiBaseUrl).AllowAnyMethod().AllowAnyHeader();
    });
});


builder.Services.AddScoped<IBuildToken, BuildToken>();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

// JWT TOKEN
app.UseAuthentication();

app.UseAuthorization();

// Hangfire
app.UseHangfireDashboard();

app.MapControllers();

app.Run();
