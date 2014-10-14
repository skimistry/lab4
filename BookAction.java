package book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;


import com.opensymphony.xwork2.ActionSupport;



public class BookAction extends ActionSupport{
	private String jspTitle;
	private String target;
	private ArrayList<Book> B=new ArrayList<Book>();
	private ArrayList<Author> A=new ArrayList<Author>();
	private Author newAuthor=new Author();
	private Book newBook=new Book(); 
	private DBConnection bookConnection=new DBConnection();
	public String searchByName()
	{
		B.clear();
		try{
			String initializeString="select * from book where authorID = ?";
			String searchAuthorString="select * from author where name= ?";
			Connection tempConnection=bookConnection.getConnection();
			PreparedStatement bookstmt=tempConnection.prepareStatement(searchAuthorString);
			PreparedStatement jokePreparedStatement=tempConnection.prepareStatement(initializeString); 
			bookstmt.setString(1, target);
			ResultSet tempSet=bookstmt.executeQuery();
			ResultSet rs=null;
			if(tempSet.next())
			{	
				jspTitle=target+"'s Book";
				do
				{
					jokePreparedStatement.setInt(1,	tempSet.getInt("authorID"));
					rs=jokePreparedStatement.executeQuery();
					if(rs.next())
					{
						do{
							Book tempBook=new Book(rs.getString("ISBN"),rs.getString("title"),
									(String)Integer.toString(rs.getInt("authorID")),rs.getString("publishDate"),
									rs.getString("publisher"),(String)Double.toString(rs.getDouble("price")));
							B.add(tempBook);
						}while(rs.next());
					}
					else {
						System.out.println("find no book");
					}
				}while(tempSet.next());
			}	
			else {
				jspTitle="Not Find Author:"+target;
				System.out.print("not find author");
			}
			}catch(Exception e){
				jspTitle="Search Fail";
				System.out.println("fail in searchByBook");
			}
			return SUCCESS;
	}
	//*************************************************************************************************************
	public String information()
	{
		B.clear();
		try{
			String initializeString="select * from author where authorID = ?";
			String searchBookString="select * from book where ISBN= ?";
			Connection tempConnection=bookConnection.getConnection();
			PreparedStatement jokePreparedStatement=tempConnection.prepareStatement(initializeString); 
			PreparedStatement bookstmt=tempConnection.prepareStatement(searchBookString);
			bookstmt.setString(1, target);
			ResultSet rs= bookstmt.executeQuery();
			target="1";
			if(rs.next())
			{
				jspTitle="Information about "+rs.getString("title");
				do{
					Book tempBook=new Book(rs.getString("ISBN"),rs.getString("title"),
								Integer.toString(rs.getInt("authorID")),rs.getString("publishDate"),
								rs.getString("publisher"),Double.toString(rs.getDouble("price")));
					B.add(tempBook);
					jokePreparedStatement.setInt(1,	rs.getInt("authorID"));
					ResultSet temp=jokePreparedStatement.executeQuery();
					if(temp.next()){
						Author tempAuthor=new Author((String)temp.getString("authorID"),temp.getString("name"),temp.getString("age"),temp.getString("country"));
						A.add(tempAuthor);
					}
					else {
						Author nullAuthor=new Author();
						A.add(nullAuthor);
					}
					target="9";
				}while(rs.next());
			}
			else {
				jspTitle="The book doesn't exist.";
				System.out.println("not find");
			}
			}catch(Exception e){
				jspTitle="Fail in Finding This Book:"+target;
				System.out.println("fail in information");
			}
			return SUCCESS;
	}
	//*************************************************************************************************************
	public String searchByBook() throws SQLException
	{	
		B.clear();
		try{
		Connection tempConnection=bookConnection.getConnection();
		String initialString="select * from book where title= ?";
		PreparedStatement bookstmt=tempConnection.prepareStatement(initialString);
		bookstmt.setString(1, target);
		ResultSet rs= bookstmt.executeQuery();
		if(rs.next())
		{
			jspTitle="Searching Result";
			do{
				Book tempBook=new Book(rs.getString("ISBN"),rs.getString("title"),
							Integer.toString(rs.getInt("authorID")),rs.getString("publishDate"),
							rs.getString("publisher"),Double.toString(rs.getDouble("price")));
				B.add(tempBook);
			}while(rs.next());
		}
		else {
			jspTitle="not find";
			System.out.println("not find");
		}
		}catch(Exception e){
			jspTitle="search fail";
			System.out.println("fail in searchByBook");
		}
		return SUCCESS;
	}
	//******************************************************************************************************
	public String delete()
	{
		B.clear();
		try{
		Connection tempConnection=bookConnection.getConnection();
		Statement bookstmt=tempConnection.createStatement();
		bookstmt.executeUpdate("delete from book where ISBN= '"+target+"'");
		jspTitle="Delete Succeed";
		}catch(Exception e){
			jspTitle="fail in delete";
			System.out.println("fail in delete");
		}
		return SUCCESS;
	}
	//**************************************************************************************************
	public void display(Book i)
	{
		System.out.println(i.getISBN()+"   "+i.getTitle()+"   "+
						i.getAuthorID()+"   "+i.getPublisher()+"   "+
						i.getPublishDate()+"   "+i.getPrice());
	}
	public void display(Author i)
	{
		System.out.println(i.getAuthorID()+"   "+i.getName()+"   "+
						i.getAge()+"   "+i.getCountry());
	}
	public String getJspTitle() {
		return jspTitle;
	}
	public void setJspTitle(String jspTitle) {
		this.jspTitle = jspTitle;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public ArrayList<Book> getB() {
		return B;
	}
	public void setB(ArrayList<Book> b) {
		B = b;
	}
	public ArrayList<Author> getA() {
		return A;
	}
	public void setA(ArrayList<Author> a) {
		A = a;
	}
	public Book getNewBook() {
		return newBook;
	}
	public void setNewBook(Book newBook) {
		this.newBook = newBook;
	}
	public Author getNewAuthor() {
		return newAuthor;
	}
	public void setNewAuthor(Author newAuthor) {
		this.newAuthor = newAuthor;
	}
}
