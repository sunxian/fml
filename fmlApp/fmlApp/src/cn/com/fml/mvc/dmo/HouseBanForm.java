package cn.com.fml.mvc.dmo;

import java.util.List;

public class HouseBanForm {
    List<TbHouseBan> HouseBans;

	public List<TbHouseBan> getHouseBans() {
		return HouseBans;
	}

	public void setHouseBans(List<TbHouseBan> houseBans) {
		HouseBans = houseBans;
	}

	@Override
	public String toString() {
		return "HouseBanForm [HouseBans=" + HouseBans + "]";
	}
    
}
