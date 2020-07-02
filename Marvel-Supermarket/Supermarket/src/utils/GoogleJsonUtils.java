package utils;

import entity.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import dao.BookDAO;

public class GoogleJsonUtils {
	private Book book = new Book();

	// 私有的构造函数，初始化的时候生成book
	private GoogleJsonUtils(String json) {
		JSONObject jsonObject = JSONObject.fromObject(json);
		//第一层
		JSONArray jsonArray = jsonObject.getJSONArray("items");
		JSONObject item = jsonArray.getJSONObject(0);
		//第二层
		JSONObject volumeInfo = item.getJSONObject("volumeInfo");
		
		Book book = new Book();
		BookDAO bookDAO = BookDAO.getInstance();
		//自动生成图书编号
		book.setBookNo(bookDAO.getMax() + 1);
		//获取图书标题
		book.setTitle(volumeInfo.getString("title"));
		//获取作者列表
		//System.out.println(volumeInfo.getString("title"));
		JSONArray authors = volumeInfo.getJSONArray("authors");
		String author = "";
		for(int i = 0; i < authors.size(); i++) {
			author = author + authors.getString(i) + " ";
		}
		//System.out.println(author);
		book.setAuthor(author);
		//获取出版商
		try {
			book.setPublish(volumeInfo.getString("publisher"));
		} catch(JSONException e) {
			book.setPublish("Unknown!");
			e.printStackTrace();
		}
		//获取出版时间
		book.setTime(volumeInfo.getString("publishedDate"));
		//获取简介
		try {
			book.setBrief(volumeInfo.getString("description"));
		}catch(JSONException e) {
			book.setBrief("No Brief!");
			e.printStackTrace();
		}
		//获取语言
		book.setLanguage(volumeInfo.getString("language"));
		//获取ISBN，如果只有10位ISBN则取10位，否则取13位
		JSONArray ii = volumeInfo.getJSONArray("industryIdentifiers");
		JSONObject jsonISBN = new JSONObject();
		if(ii.size() == 1) {
			jsonISBN = ii.getJSONObject(0);
		} else {
			jsonISBN = ii.getJSONObject(1);
		}
		book.setISBN(jsonISBN.getString("identifier"));
		//获取价格，如果没有就空着
		JSONObject saleInfo = (JSONObject) item.get("saleInfo");
		if(saleInfo.getString("saleability") == " FOR_SALE") {
			JSONObject retailPrice = saleInfo.getJSONObject("retailPrice");
			book.setPrice(retailPrice.getString("amount") + " " + retailPrice.getString("currencyCode"));
		}else {
			book.setPrice("Not For Sale!");
		}
		
		this.book = book;
	}

	public static GoogleJsonUtils getInstance(String json) {
		return new GoogleJsonUtils(json);
	}

	public Book getBook() {
		return this.book;
	}

}

