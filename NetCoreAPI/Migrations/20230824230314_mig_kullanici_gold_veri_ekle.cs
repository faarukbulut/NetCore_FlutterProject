using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetCoreAPI.Migrations
{
    public partial class mig_kullanici_gold_veri_ekle : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "gold",
                table: "Kullanicis",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "goldsure",
                table: "Kullanicis",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "gold",
                table: "Kullanicis");

            migrationBuilder.DropColumn(
                name: "goldsure",
                table: "Kullanicis");
        }
    }
}
