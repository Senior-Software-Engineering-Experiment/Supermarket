CREATE TABLE adminaccount
(
  ano text NOT NULL,
  apassword text,
  PRIMARY KEY (ano)
);

CREATE TABLE adminlock
(
  alno text NOT NULL,
  alpassword text,
  PRIMARY KEY (alno)
);

--读者表（顾客表）
CREATE TABLE Reader(
    ReaderNo text NOT NULL UNIQUE,
    ReaderName text NOT NULL,
    ReaderPassword text,
    Email text NOT NULL,
    ReaderFine INT,
    PRIMARY KEY(ReaderNo) 
);

--图书管理员表（售货员表）
CREATE TABLE Librarian(
    lusername text NOT NULL,
    lpassword text,
    lname text NOT NULL,
    lsex text,
    ltel text,
    lemail text,
    PRIMARY KEY (lusername) 
);

--这里要插默认值1，30，300
CREATE TABLE Fine(
    BookFine INT NOT NULL,
    ReturnPeriod INT NOT NULL,
    SecurityDesposit INT NOT NULL
);

CREATE TABLE Income(
    Day TIMESTAMP,
    TotalFine INT,--罚金，有人缴纳罚金就更新（当天交易次数）
    TotalDeposit INT,--保证金,如果有人注册就更新（当天营业总额）
    PRIMARY KEY(Day)
);

CREATE TABLE Book(
	BookNo INT, 
	Title text,  
	Author text,
                Language text, 
	Price text, 
	Time text, 
	Publish text,
	Brief text, 
	ISBN text,
    Category text,
    Location text,
	PRIMARY KEY(BookNo)
);

CREATE TABLE Category(
    CategoryNo INT,
    CategoryName text NOT NULL UNIQUE,
    PRIMARY KEY(CategoryNo) 
);

CREATE TABLE Location(
   
    locationNo INT,
    locationName text NOT NULL UNIQUE,
    PRIMARY KEY(locationNo) 
);


CREATE TABLE POST(
    PostNo INT NOT NULL UNIQUE,
    PostTime TIMESTAMP,
    Title text,
    Content text,
    LibrarianNo text,
    PRIMARY KEY(PostNo) 
);

CREATE TABLE Borrow(
    BookNo INT NOT NULL,
    ReaderNo text,
    BorrowTime TIMESTAMP,
    IsReturned BOOLEAN,
    ShouldReturnTime TIMESTAMP,  --应还的日期（购物日期）
    ReturnTime TIMESTAMP, --实际还书的日期（插入记录的日期）
    PRIMARY KEY(BookNo,BorrowTime) 
);

--预约的表
--修改了ReserveTime的数据类型，精确到分钟
--主键改成了联合主键,书号加预约时间可以唯一确定一条预约记录
CREATE TABLE Reserve(
    BookNo INT NOT NULL,
    ReaderNo text,
    ReserveTime TIMESTAMP,
    PRIMARY KEY(BookNo,ReserveTime) 
);

--删除记录的表
CREATE TABLE DeleteRec(
    BookNo INT NOT NULL,
    Librarianusername text NOT NULL,
    DeleteTime TIMESTAMP,
    title text,
    author text,
    PRIMARY KEY(BookNo)
);

--团队成员
CREATE TABLE TeamMember(
    MemberNo int NOT NULL UNIQUE ,
    MemberName VARCHAR(20),
    MemberDescribe text,
    MemberPicutre text,
    PRIMARY KEY(MemberName)
);

