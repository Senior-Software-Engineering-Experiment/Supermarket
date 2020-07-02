package dao;

import entity.*;
import utils.JsonUtils;
import java.io.IOException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class DoubanAPI {
	// 所有调用豆瓣API的函数都要throws ClientProtocolException,IOException

	private DoubanAPI() {
	}

	public static DoubanAPI getInstance() {
		return new DoubanAPI();
	}

	public Book searchByISBN(String isbn) throws ClientProtocolException, IOException {
		Book book = new Book();
		String url = "https://douban.uieee.com/v2/book/isbn/" + isbn;
		CloseableHttpClient client = HttpClients.createDefault();
		HttpGet get = new HttpGet(url);
		HttpResponse response = client.execute(get);
		HttpEntity entity = response.getEntity();
		String json = EntityUtils.toString(entity);
        //System.out.println(json);
		// 用来根据ISBN加书
		JsonUtils jsonUtils = JsonUtils.getInstance(json);
		book = jsonUtils.getBook();
		
		return book;
	}
	
	
	//public static void main(String args[]) throws ClientProtocolException,IOException {
		//DoubanAPI doubanAPI = DoubanAPI.getInstance();
		//测试用
		//try {
			//doubanAPI.searchByISBN("9781783700608");
		//} catch (ClientProtocolException e) {
			// TODO: handle exception
			//System.out.println("连接错误！");
		//} catch (IOException ioe) {
			// TODO: handle exception
			//System.out.println("IO错误！");
		//}
	//}
	

}
