package cn.com.fml.mvc.common;

/**
 * 常量类
 * @author 15050513
 *
 */
public class FmlConstants {
	
	//参数错误
	public static final String ERROR_CODE_TYPE1 = "00";
	//未查询到数据
	public static final String ERROR_CODE_TYPE2 = "01";
	//其他错误
	public static final String ERROR_CODE_TYPE3 = "02";
	
	/**
	 * 资产类别
	 */
	public interface AssetsCode {
		/**
		 * 首页顶部图片
		 */
		public static final String HOME_PAGE_TOPIMAGE = "01";
		/**
		 * 楼盘列表页 列表缩略图
		 */
		public static final String LIST_PAGE_SNAPSHORT = "02";
		/**
		 * 楼盘详情页顶部图片
		 */
        public static final String DETAIL_PAGE_TOPIMAGE = "03";

    	
    }
}
