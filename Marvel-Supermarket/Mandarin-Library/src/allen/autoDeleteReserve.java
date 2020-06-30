package allen;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import dao.ReserveDAO;

public  class autoDeleteReserve implements ServletContextListener{
	public void contextInitialized(ServletContextEvent event) {
		Runnable runnable = new Runnable() {
			
			public void run() {
				ReserveDAO reserveDAO =  ReserveDAO.getInstance();
				reserveDAO.execture();
			}
		};
		
		ScheduledExecutorService service = Executors
				.newSingleThreadScheduledExecutor();
		
		// 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间  单位分
		service.scheduleAtFixedRate(runnable, 1/60, 115, TimeUnit.MINUTES);
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	
}
