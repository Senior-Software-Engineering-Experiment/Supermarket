package dao;

import entity.*;
import utils.*;
import java.io.IOException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class GoogleAPI {

	private GoogleAPI() {
	}

	public static GoogleAPI getInstance() {
		return new GoogleAPI();
	}

	public Book searchByISBN(String isbn) throws ClientProtocolException, IOException {
		Book book = new Book();
		String url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn;
		CloseableHttpClient client = HttpClients.createDefault();
		HttpGet get = new HttpGet(url);
		HttpResponse response = client.execute(get);
		HttpEntity entity = response.getEntity();

		String json = EntityUtils.toString(entity);
		
		GoogleJsonUtils jsonUtils = GoogleJsonUtils.getInstance(json);
		book = jsonUtils.getBook();
		return book;
	}
	
	/*
	public static void main(String args[]) throws ClientProtocolException,IOException {
		GoogleAPI googleAPI = GoogleAPI.getInstance();
		try {
			googleAPI.searchByISBN("9787111582335");
		} catch (ClientProtocolException e) {
			System.out.println("���Ӵ���");
		} catch (IOException ioe) {
			System.out.println("IO����");
		}
	}
	*/

}
