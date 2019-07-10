package org.protectedog.service.domain;

public class Breed {
	
	/// Field
	private int breedNo;
	private double weight;
	private double height;
	private int avgLife;
	private String types;
	private String Image;
	private String name;
	private String addInfo;
	
	/// Constructor
	
	/// Method
	public int getBreedNo() {
		return breedNo;
	}
	public void setBreedNo(int breedNo) {
		this.breedNo = breedNo;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public int getAvgLife() {
		return avgLife;
	}
	public void setAvgLife(int avgLife) {
		this.avgLife = avgLife;
	}
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddInfo() {
		return addInfo;
	}
	public void setAddInfo(String addInfo) {
		this.addInfo = addInfo;
	}
	
	@Override
	public String toString() {
		return "Breed [breedNo=" + breedNo + ", weight=" + weight + ", height=" + height + ", avgLife=" + avgLife
				+ ", types=" + types + ", Image=" + Image + ", name=" + name + ", addInfo=" + addInfo + "]";
	}
	
	
}
