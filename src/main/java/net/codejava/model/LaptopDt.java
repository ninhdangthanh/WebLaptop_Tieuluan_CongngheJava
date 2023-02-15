package net.codejava.model;

public class LaptopDt {
	private Laptop laptop;
	private Trademark trademark;
	
	public LaptopDt(Laptop laptop, Trademark trademark) {
		super();
		this.laptop = laptop;
		this.trademark = trademark;
	}

	public LaptopDt() {
		super();
	}

	public Laptop getLaptop() {
		return laptop;
	}

	public void setLaptop(Laptop laptop) {
		this.laptop = laptop;
	}

	public Trademark getTrademark() {
		return trademark;
	}

	public void setTrademark(Trademark trademark) {
		this.trademark = trademark;
	}

	@Override
	public String toString() {
		return "LaptopDt [laptop=" + laptop + ", trademark=" + trademark + ", getLaptop()=" + getLaptop()
				+ ", getTrademark()=" + getTrademark() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
