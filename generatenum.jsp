<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<%



		int[] wordListOne = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55};
		
		int[] wordListTwo = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55};
		
		int[] wordListThree = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55};
		
		int[] wordListFour = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55};

		int[] wordListFive = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55};

		int[] wordListSix = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55};

		//find out how may words are in each list
		
		int oneLength = wordListOne.length;
		int twoLength = wordListTwo.length;
		int threelength = wordListThree.length;
		int fourlength = wordListFour.length;
		int fivelength = wordListFive.length;
		int sixlength = wordListSix.length;

		
		//generate random numbers
		int rand1 = (int) (Math.random() * oneLength);
		int rand2 = (int) (Math.random() * twoLength);
		
		do 
		{
			rand2 = (int) (Math.random() * twoLength);
		}while (rand1==rand2);
		
		int rand3 = (int) (Math.random() * threelength);
		
		do{
		rand3 = (int) (Math.random() * threelength);
		} while (rand1==rand3 || rand2==rand3);
		
		int rand4 = (int) (Math.random() * fourlength);
		
		do{
		rand4 = (int) (Math.random() * fourlength);
		} while (rand1==rand4 || rand2==rand4 || rand3==rand4);
		
		int rand5 = (int) (Math.random() * fivelength);
		
		do{
		rand5 = (int) (Math.random() * fivelength);
		} while (rand1==rand5 || rand2==rand5 || rand3==rand5 || rand4==rand5);
		
		
		int rand6 = (int) (Math.random() * sixlength);
		
		do{
		rand6 = (int) (Math.random() * sixlength);
		}while (rand1==rand6 || rand2==rand6 || rand3==rand6 || rand4==rand6 || rand5==rand6);		
		
		//new build phrase
		
		String phrase = wordListOne[rand1] + " " +
		wordListTwo[rand2] + " " + wordListThree[rand3] + " " + wordListFour[rand4] + " " + wordListFive[rand5] + " " + wordListSix[rand6];
		

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>Draw Winning Numbers</title>
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
            <h3 class="subheader"><a href="">Draw Winning Numbers</a></h3>
            <div class="in">
			
									<%
			 Connection conn = null;       				
			 
       try {								
        Properties property = null;

		String propFile = "C:/Users/Jako Laureano/Desktop/apache-tomcat-6.0.29/webapps/FINALmp2/dbsource.property";
        FileInputStream fis = new FileInputStream(propFile) ;
        property = new Properties();
        property.load(fis);
            
        
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
            
        
        Class.forName(typedriver);				      
	      String url = "jdbc:jtds:sqlserver://"+server+":1433"+"//"+dbName;
	     
        conn = (Connection) application.getAttribute("connection");
		int compare=0;
       java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
        
        Statement stmt = conn.createStatement();	
			  ResultSet rs = stmt.executeQuery("Select DISTINCT Status from Bet where Status = 'active' ");
				
			  int iCtr = 0;
		      while(rs.next()){
			   iCtr++;
			   if(rs.getString("Status").equals("active")) { %>
			  <form method="GET" action="addwin.jsp">
				<input type="text" name="win1" value="<%=wordListOne[rand1]%>" size="5">
				<input type="text" name="win2" value="<%=wordListTwo[rand2]%>" size="5">
				<input type="text" name="win3" value="<%=wordListThree[rand3]%>" size="5">
				<input type="text" name="win4" value="<%=wordListFour[rand4]%>" size="5">
				<input type="text" name="win5" value="<%=wordListFive[rand5]%>" size="5">
				<input type="text" name="win6" value="<%=wordListSix[rand6]%>" size="5">
				</p>
				<p>
				<input type="Submit" value="Submit">	
				 <% } else { 
					out.print("NO BETS PLACED");
				}
			}	System.out.println("Players: " + iCtr);  
		  	  			
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
                <br/>
                <h6><a href="viewwinners.jsp">View Winners of the Draw</a></h6> 				 
			</form>
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
