package net.codejava.model;

public class LaptopDetail {
	private int id;
    private String name;
    private String price;
    private int price_real;
    private String series;
    private String past_price;
    private String cpu;
    private String cpu_compact;
    private String ram;
    private String ram_compact;
    private String memory_compact;
    private String card;
    private String screen;
    private String screen_compact;
    private String link_img;
    private String trademark_id;
    private String trademark_name;
    
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getPrice_real() {
		return price_real;
	}
	public void setPrice_real(int price_real) {
		this.price_real = price_real;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getPast_price() {
		return past_price;
	}
	public void setPast_price(String past_price) {
		this.past_price = past_price;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getCpu_compact() {
		return cpu_compact;
	}
	public void setCpu_compact(String cpu_compact) {
		this.cpu_compact = cpu_compact;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getRam_compact() {
		return ram_compact;
	}
	public void setRam_compact(String ram_compact) {
		this.ram_compact = ram_compact;
	}
	public String getMemory_compact() {
		return memory_compact;
	}
	public void setMemory_compact(String memory_compact) {
		this.memory_compact = memory_compact;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getScreen() {
		return screen;
	}
	public void setScreen(String screen) {
		this.screen = screen;
	}
	public String getScreen_compact() {
		return screen_compact;
	}
	public void setScreen_compact(String screen_compact) {
		this.screen_compact = screen_compact;
	}
	public String getLink_img() {
		return link_img;
	}
	public void setLink_img(String link_img) {
		this.link_img = link_img;
	}
	public String getTrademark_id() {
		return trademark_id;
	}
	public void setTrademark_id(String trademark_id) {
		this.trademark_id = trademark_id;
	}
	public String getTrademark_name() {
		return trademark_name;
	}
	public void setTrademark_name(String trademark_name) {
		this.trademark_name = trademark_name;
	}
	public LaptopDetail(int id, String name, String price, int price_real, String series, String past_price, String cpu,
			String cpu_compact, String ram, String ram_compact, String memory_compact, String card, String screen,
			String screen_compact, String link_img, String trademark_id, String trademark_name) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.price_real = price_real;
		this.series = series;
		this.past_price = past_price;
		this.cpu = cpu;
		this.cpu_compact = cpu_compact;
		this.ram = ram;
		this.ram_compact = ram_compact;
		this.memory_compact = memory_compact;
		this.card = card;
		this.screen = screen;
		this.screen_compact = screen_compact;
		this.link_img = link_img;
		this.trademark_id = trademark_id;
		this.trademark_name = trademark_name;
	}
	public LaptopDetail() {
		super();
	}
	@Override
	public String toString() {
		return "LaptopDetail [id=" + id + ", name=" + name + ", price=" + price + ", price_real=" + price_real
				+ ", series=" + series + ", past_price=" + past_price + ", cpu=" + cpu + ", cpu_compact=" + cpu_compact
				+ ", ram=" + ram + ", ram_compact=" + ram_compact + ", memory_compact=" + memory_compact + ", card="
				+ card + ", screen=" + screen + ", screen_compact=" + screen_compact + ", link_img=" + link_img
				+ ", trademark_id=" + trademark_id + ", trademark_name=" + trademark_name + "]";
	}
    
    
}
