using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using NetCoreAPI.DAL;
using NetCoreAPI.Models;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

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

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

// JWT TOKEN
app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

app.Run();
