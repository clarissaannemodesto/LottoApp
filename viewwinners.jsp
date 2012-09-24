<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="mem" class="memberBean.member" scope="session"/>
<jsp:setProperty name="mem" property="*"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>Winners</title>
    <link rel="stylesheet" type="text/css" href="./css/default.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<span id="pendule"></span>
<script language="javascript" type="text/javascript">
function clock() {
var digital = new Date();
var hours = digital.getHours();
var minutes = digital.getMinutes();
var seconds = digital.getSeconds();
var amOrPm = "AM";
if (hours > 11) amOrPm = "PM";
if (hours > 12) hours = hours - 12;
if (hours == 0) hours = 12;
if (minutes <= 9) minutes = "0" + minutes;
if (seconds <= 9) seconds = "0" + seconds;
dispTime = '<b>'+hours + ":" + minutes + ":" + seconds + " " + amOrPm+'</b>';
document.getElementById('pendule').innerHTML = dispTime;
setTimeout("clock()", 1000);
}
window.onload=clock;
var mydate=new Date()
var year=mydate.getYear()
if (year < 1000)
year+=1900
var day=mydate.getDay()
var month=mydate.getMonth()
var daym=mydate.getDate()
if (daym<10)
daym="0"+daym
var dayarray=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December")
document.write("<medium><font color='yellow' face='Arial'><b>"+dayarray[day]+", "+montharray[month]+" "+daym+", "+year+"</b></font></small>")
</script>
  
  
    <hr class="hidden" />
    <div id="view">
 
      <div id="head">
        <h1 id="logotype">Jan & Yzza Lottery Store</h1>
        
      </div>
      
      <hr class="hidden" />
      
    
      <div id="content">
        <div id="contentBlock">
          <h2 class="subheader biggest">Welcome Admin!</h2>
          
          <div class="item first">
            <h3 class="subheader"><a href="">Winners of the Draw</a></h3>
            <div class="in">

<%
			 Connection conn = null; 
			 			 
			 
       try {								
        Properties property = null;

		String propFile = "C:/Users/Jako Laureano/Desktop/apache-tomcat-6.0.29/webapps/FINALmp2/dbsource.property";
        FileInputStream fis = new FileInputStream(propFile) ;
        property = new Properties();
        property.load(fis);
            
        // getting file name from properties
        String name = property.getProperty("username");
        String password = property.getProperty("password");
        String server = property.getProperty("servername");
        String typedriver = property.getProperty("typedriver");
        String dbName = property.getProperty("databasename");   
                       				  
        System.out.println("name: " + name);          
			  System.out.println("password: " + password);
        System.out.println("server: " + server);
        System.out.println("typedriver: " + typedriver);
        System.out.println("dbName: " + dbName);
            
        //db setup and connection
        Class.forName(typedriver);				      
	      String url = "jdbc:jtds:sqlserver://"+server+":1433"+"//"+dbName;
	     
        conn = (Connection) application.getAttribute("connection");
		int compare=0;
       java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
        //get result set for employee
        Statement stmt1 = conn.createStatement();
		Statement pstmt2 = conn.createStatement();
		PreparedStatement pstmt = null;
			  ResultSet rs = stmt1.executeQuery("Select * from WinComb where date='"+ sqlDate +"' and status = 'active'");
			  ResultSet prs = pstmt2.executeQuery("Select * from Bet where date='"+ sqlDate +"' and status= 'active'");
			  			

			  int iCtr = 0;
			  
			  if(rs.next())
			  {
			  while(prs.next()){
			  for(int i=2; i<8; i++){
			  for(int j=3; j<9;j++)
			  {
				if(rs.getInt(i) == prs.getInt(j))
				{
					compare++;
					if(compare==6){
					String query = "Update Bet Set Hit = '6' where Email ='" + prs.getString("Email") + "'";
						pstmt = conn.prepareStatement(query);
						pstmt.executeUpdate();
						out.print(prs.getString("Email") + " JACKPOT");
						int win6 = 0;
						win6++;
						System.out.println(win6++);

						pstmt = conn.prepareStatement(query);
						pstmt.executeUpdate();
					} if(compare == 5) {
					String query = "Update Bet Set Hit  = '5' where Email ='"+prs.getString("Email")+"'";
						pstmt = conn.prepareStatement(query);
						pstmt.executeUpdate();
						out.print(prs.getString("Email") + " 5-Digit!");
						int win4 = 0;
						win4++;
						System.out.println(win4++);
					} if(compare == 4) {
						String query = "Update Bet Set Hit  = '4' where Email ='"+prs.getString("Email")+"'";
						pstmt = conn.prepareStatement(query);
						pstmt.executeUpdate();
						out.print(prs.getString("Email") + " 4-Digit!");
						int win5 = 0;
						win5++;
						System.out.println(win5++);
					} if(compare == 3) {
					String query = "Update Bet Set Hit  = '3' where Email ='"+prs.getString("Email")+"'";
						pstmt = conn.prepareStatement(query);
						pstmt.executeUpdate();
						out.print(prs.getString("Email") + " 3-Digit!");
						int win6 = 0;
						win6++;
						System.out.println(win6++);
					} if(compare == 0) {
						String query = "Update Bet Set status = 'inactive' where Email ='" + prs.getString("Email")+"'";
						pstmt = conn.prepareStatement(query);
						pstmt.executeUpdate();
				} 
				}
			  }
			  }
			  }
				 
			  
				} 
		  	  			
    	} catch (IOException ioe) {
    		  System.out.println("IOException occured: " + ioe.getMessage());
    	} catch (SQLException sqle) {
          System.out.println("SQLException occured: " + sqle.getMessage());  	
    	}	catch (Exception e) {				
  				System.out.println(e.getMessage());			  								
			}	finally {
			   if (conn!=null) {
			     application.setAttribute("connection",conn);
         }
      }					
		%>


          </div>
        </div>
		</div>
        
        <hr class="hidden" />
      </div>
      <hr class="hidden noprint" />
      <div id="menu">
        <ul id="mainMenu">
          <li><a href="admin.jsp">Home</li>
        </ul>
        <ul id="subMenu">
          <li><a href="userlogin.jsp"><strong>Logout</strong></a></li>
        </ul>
      </div>
      <hr class="hidden noprint" />
            <div id="foot">
        <ul class="support">
        </ul>        <ul class="menu">
        </ul>
		<center>
		Copyright &copy; 2012 <a href="#">PCSO LOTTO GAME</a> | 
        Designed by <a href="#">TEAM JY</a> |
        Prepared for <a href="#">PROGAP3</a>
		</center>
      </div>

    </div>

  </body>
</html>
