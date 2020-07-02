package entity;

public class Incomegroup {
      private String year;
      private String month;
      private String week;
      private String day;
      private int income;
      private int fine;
      private int deposit;
      
      public Incomegroup() {
    	  super();
      }
      
      public Incomegroup(String year,String month,String week,int income,int fine,int deposit) {
    	  this.year=year;
    	  this.month=month;
    	  this.week=week;
    	  this.income=income;
    	  this.fine=fine;
    	  this.deposit=deposit;
      }

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public int getFine() {
		return fine;
	}

	public void setFine(int fine) {
		this.fine = fine;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	


      
}
