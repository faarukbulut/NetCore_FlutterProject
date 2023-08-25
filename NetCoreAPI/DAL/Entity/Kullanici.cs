namespace NetCoreAPI.DAL.Entity
{
    public class Kullanici
    {
        public int KullaniciID { get; set; }
        public string KullaniciAdi { get; set; }
        public string Sifre { get; set; }
        public string? AdSoyad { get; set; }
        public bool gold { get; set; }
        public int goldsure { get; set; }
    }
}
