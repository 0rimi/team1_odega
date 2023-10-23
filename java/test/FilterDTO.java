package test;
import java.util.ArrayList;
public class FilterDTO { 
	
	private ArrayList<String> ageList = new ArrayList<>();
	private ArrayList<String> whoList = new ArrayList<>();
	private ArrayList<String> dayList = new ArrayList<>();
	private ArrayList<String> placeList = new ArrayList<>();
	private ArrayList<String> cityList = new ArrayList<>();
	public ArrayList<String> getAgeList() {
		return ageList;
	}
	public void setAgeList(ArrayList<String> ageList) {
		this.ageList = ageList;
	}
	public ArrayList<String> getWhoList() {
		return whoList;
	}
	public void setWhoList(ArrayList<String> whoList) {
		this.whoList = whoList;
	}
	public ArrayList<String> getDayList() {
		return dayList;
	}
	public void setDayList(ArrayList<String> dayList) {
		this.dayList = dayList;
	}
	public ArrayList<String> getPlaceList() {
		return placeList;
	}
	public void setPlaceList(ArrayList<String> placeList) {
		this.placeList = placeList;
	}
	public ArrayList<String> getCityList() {
		return cityList;
	}
	public void setCityList(ArrayList<String> cityList) {
		this.cityList = cityList;
	}

	
	
}
