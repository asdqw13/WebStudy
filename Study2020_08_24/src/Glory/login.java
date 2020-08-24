package Glory;

public class login
{
	private String name;
	private String id;
	private String pw;
	
	final String _id="system";
	final String _pw="123456";
	
	public boolean checkid()
	{
		if(id.equals(_id) && pw.equals(_pw)) return true;
		else return false;
	}
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPw()
	{
		return pw;
	}
	public void setPw(String pw)
	{
		this.pw = pw;
	}
}