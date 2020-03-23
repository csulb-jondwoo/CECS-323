import java.sql.*;
import java.util.Scanner;

/**
 *
 * @author Mimi Opkins with some tweaking from Dave Brown
 */
public class JDBC {
//  Database credentials
    static String USER;
    static String PASS;
    static String DBNAME;
    //This is the specification for the printout that I'm doing:
    //each % denotes the start of a new field.
    //The - denotes left justification.
    //The number indicates how wide to make the field.
    //The "s" denotes that it's a string.  All of our output in this test are 
    //strings, but that won't always be the case.
    static final String displayFormat="%-30s%-50s%-25s%-15s\n";
    static final String displayFormatGroup="%-20s%-20s%-20s%-20s%-30s%-20s\n";
    static final String displayFormatPub_book="%-25s%-50s%-20s%-25s%-20s\n";
// JDBC driver name and database URL
    static final String JDBC_DRIVER = "org.apache.derby.jdbc.ClientDriver";
    static String DB_URL = "jdbc:derby://localhost:1527/";

    Scanner in = new Scanner(System.in);
/**
 * Takes the input string and outputs "N/A" if the string is empty or null.
 * @param input The string to be mapped.
 * @return  Either the input string or "N/A" as appropriate.
 */
    public static String dispNull (String input) {
        //because of short circuiting, if it's null, it never checks the length.
        if (input == null || input.length() == 0)
            return "N/A";
        else
            return input;
    }
    
    //main menu
    public static void mainMenu(){
        System.out.println("Main Menu:\n"
                        + "1. List all groups\n"
                        + "2. Select group\n"
                        + "3. List all publishers\n"
                        + "4. Select publisher\n"
                        + "5. List all books \n"
                        + "6. Select book\n"
                        + "7. Insert new book\n"
                        + "8. Insert new publisher and update\n"
                        + "9. Remove book\n"
                        + "10. Quit");
        System.out.println("\n");
    }
    
    //userinput validation function
    public static int inputValidation(Scanner input){
        int user_input; 
        do {
            System.out.println("Please enter a number from the menu: ");
            while (!input.hasNextInt()) {
                System.out.println("\nPlease enter an integer number: ");
                input.next();
            }
            user_input = input.nextInt();
        } while (user_input < 1 || user_input > 10);

        input.nextLine();
        return user_input;
    };

    public static void sqlResponse(String response){
        if(response.contains("PUBLISHERS") && response.contains("PUB_PK"))
            System.out.println("Could not add the publisher since the name of the publisher is used.");
        if(response.contains("BOOKS") && response.contains("BOOKS_PK"))
            System.out.println("Could not insert the book since the book title and groupname is already contained in the database.");
        if(response.contains("BOOKS") && response.contains("BOOKS_UK01"))
            System.out.println("Could not insert book since the book title and publisher is already contained in the database.");
        if(response.contains("BOOKS") && response.contains("BOOKS_PUB_FK02"))
            System.out.println("The publisher for the book could not be found.");
        if(response.contains("BOOKS") && response.contains("BOOKS_WG_FK01"))
            System.out.println("Could not find the publisher inserted.");
        if(response.contains("WRITINGGROUPS") && response.contains("WRITINGGROUP_PK"))
            System.out.println("Could not find the writing group inserted.");
    }

    public static void main(String[] args) {
        //Prompt the user for the database name, and the credentials.
        //If your database has no credentials, you can update this code to 
        //remove that from the connection string.
        Scanner in = new Scanner(System.in);
        System.out.print("Name of the database (not the user account): ");
        DBNAME = in.nextLine();
        System.out.print("Database user name: ");
      //  USER = in.nextLine();
      // System.out.print("Database password: ");
      //  PASS = in.nextLine();
        //Constructing the database URL connection string
        //DB_URL = DB_URL + DBNAME + ";user="+ USER + ";password=" + PASS;
       DB_URL = DB_URL + DBNAME;
        Connection conn = null; //initialize the connection
        Statement stmt = null;  //initialize the statement that we're using
        try {
            //Register JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            //Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL);
            //Execute a query
//            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            PreparedStatement prepStmt = null;
            String sql = null;
            ResultSet rs = null;
            
            boolean menu = true;
            while(menu){
            // Output the Menu
                mainMenu();
                int user_input = inputValidation(in);
                switch(user_input){
                case 1:
                    //case 1: list all writing groups
                    sql = "SELECT groupName, headWriter, yearFormed, subject FROM writingGroups";
                    rs = stmt.executeQuery(sql);
                    System.out.printf(displayFormat, "WRITING GROUP", "HEAD WRITER", "YEAR FORMED", "SUBJECT");
                    while (rs.next()) {
                        //Retrieve by column name
                        String name = rs.getString("groupName");
                        String head = rs.getString("headWriter");
                        String year = rs.getString("yearFormed");
                        String subject = rs.getString("subject");
                        //Display values
                        System.out.printf(displayFormat, 
                                dispNull(name), dispNull(head), dispNull(year), dispNull(subject));
                        }
                    System.out.println("\n");
                    rs.close();
                    break;
                case 2:
                    //case 2: list all data for a group specified by the user
                    sql = "SELECT groupName, headWriter, yearFormed, subject, bookTitle, pubName FROM writingGroups NATURAL JOIN publishers NATURAL JOIN books WHERE groupName= ?";
                    System.out.println("Select Group Name:");
                    String group = in.nextLine();
                    prepStmt = conn.prepareStatement(sql);
                    prepStmt.setString(1, group);
                    rs = prepStmt.executeQuery();
                    System.out.printf("\n");
                    System.out.printf(displayFormatGroup, "WRITING GROUP", "HEAD WRITER", "YEAR FORMED", "SUBJECT", "TITLE", "PUBLISHER");
                    while (rs.next()) {
                        String name = rs.getString("groupName");
                        String head = rs.getString("headWriter");
                        String year = rs.getString("yearFormed");
                        String subject = rs.getString("subject");
                        String title = rs.getString("bookTitle");
                        String pubName = rs.getString("pubName");
                        //Display values
                        System.out.printf(displayFormatGroup,
                        dispNull(name), dispNull(head), dispNull(year), dispNull(subject), dispNull(title), dispNull(pubName));
                    }
                    System.out.printf("\n");
                    break;
                case 3:
                    //case 3: list all publishers
                    sql = "SELECT pubName, pubAddress, pubPhone, pubEmail FROM publishers";
                    rs = stmt.executeQuery(sql);
                    System.out.printf(displayFormat, "PUBLISHER", "ADDRESS", "PHONE", "EMAIL");
                    while (rs.next()) {
                        //Retrieve by column name
                        String name = rs.getString("pubName");
                        String address = rs.getString("pubAddress");
                        String phone = rs.getString("pubPhone");
                        String email = rs.getString("pubEmail");
                        //Display values
                        
                        System.out.printf(displayFormat, 
                                dispNull(name), dispNull(address), dispNull(phone), dispNull(email));
                        }
                    System.out.println("\n");
                    rs.close();
                    break;
                case 4:
                    //case 4: list all the data for a publisher specified by the user
                    sql = "SELECT pubName, pubAddress, pubPhone, pubEmail, bookTitle FROM publishers NATURAL JOIN books WHERE pubName= ?";
                    System.out.println("Select publisher:");
                    String pub = in.nextLine();
                    prepStmt = conn.prepareStatement(sql);
                    prepStmt.setString(1, pub);
                    rs = prepStmt.executeQuery();
                    System.out.printf("\n");
                    System.out.printf(displayFormatPub_book, "PUBLISHER", "ADDRESS", "PHONE", "EMAIL", "TITLE");
                    while (rs.next()) {
                        String name = rs.getString("pubName");
                        String address = rs.getString("pubAddress");
                        String phone  = rs.getString("pubPhone");
                        String email = rs.getString("pubEmail");
                        String title = rs.getString("bookTitle");
                        //Display values
                        System.out.printf(displayFormatPub_book,
                        dispNull(name), dispNull(address), dispNull(phone), dispNull(email), dispNull(title));
                    }
                    System.out.printf("\n");
                    break;
                case 5:
                    //case 5: list all book titles
                    sql = "SELECT bookTitle, numOfPages, groupName, pubName FROM books";
                    rs = stmt.executeQuery(sql);
                    System.out.printf(displayFormat, "TITLE", "NUMBER OF PAGES", "WRITING GROUP", "PUBLISHER");
                    while (rs.next()) {
                        //Retrieve by column name
                        String title = rs.getString("bookTitle");
                        String numPages = rs.getString("numOfPages");
                        String groupName = rs.getString("groupName");
                        String pubName = rs.getString("pubName");
                        //Display values
                        System.out.printf(displayFormat, 
                                dispNull(title), dispNull(numPages), dispNull(groupName), dispNull(pubName));
                        }
                    System.out.println("\n");
                    rs.close();
                    break;
                case 6:
                    //case 6: list all the data for a book specified by the user
                    sql = "SELECT bookTitle, numOfPages, yearPub, groupName, pubName FROM books NATURAL JOIN publishers NATURAL JOIN writingGroups WHERE bookTitle = ?";
                    System.out.println("Select book:");
                    String book = in.nextLine();
                    prepStmt = conn.prepareStatement(sql);
                    prepStmt.setString(1, book);
                    rs = prepStmt.executeQuery();
                    System.out.printf("\n");
                    System.out.printf(displayFormatPub_book, "TITLE", "NUMBER OF PAGES", "YEAR PUBLISHED", "WRITING GROUP", "PUBLISHER");
                    while (rs.next()) {
                        String title = rs.getString("bookTitle");
                        String num = rs.getString("numOfPages");
                        String year = rs.getString("yearPub");
                        String groupName  = rs.getString("groupName");
                        String pubName = rs.getString("pubName");

                        //Display values
                        System.out.printf(displayFormatPub_book,
                        dispNull(title), dispNull(num), dispNull(year), dispNull(groupName), dispNull(pubName));
                    }
                    System.out.printf("\n");
                    break;
                case 7:
                    //case 7: insert a new book
                    //gather user book info
                    System.out.print("Enter Book Title: ");
                    String title= in.nextLine();
                    
                    System.out.print("Enter Number of Pages: ");
                    int pages = in.nextInt();
                    in.nextLine();
                    
                    System.out.print("Enter Year Published: ");
                    int year = in.nextInt();
                    in.nextLine();
                    
                    System.out.print("Select Publisher: "); //must exist
                    String publisher = in.nextLine();

                    System.out.print("Select Writing Group: "); //must exist
                    String groupName = in.nextLine();
                    
                    //insert book
                    sql = "INSERT INTO books VALUES(?,?,?,?,?)";
                    prepStmt = conn.prepareStatement(sql);
                    prepStmt.setString(1, groupName);
                    prepStmt.setString(2, title);
                    prepStmt.setString(3, publisher); 
                    prepStmt.setInt(4, year);
                    prepStmt.setInt(5, pages);
                    //Try inserting the book and catch the exception
                    try{
                        prepStmt.executeUpdate();
                        prepStmt.close();
                        System.out.println("Book Inserted to the database!");
                    }catch(SQLException exception){
                        sqlResponse(exception.getMessage());
                    }
                    break;
                case 8:
                    //case 8: insert a new publisher and update all books published by one publisher to be published by the new publisher. 
                    //leave the old publisher alone, just modify the books that they have published. 
                    //assume that the new publisher has bought out the old one, so now any books published by the old publisher are published by the new one.
                    
                    //gather user publisher info    
                    System.out.println("Enter New Publisher Name: ");
                    String pubName = in.nextLine();
                    System.out.println("Enter New Publisher Address: ");
                    String pubAddress = in.nextLine();
                    System.out.println("Enter New Publisher Phone: ");
                    String pubPhone = in.nextLine();
                    System.out.println("Enter New Publisher Email: ");
                    String pubEmail = in.nextLine();

                    //Inserts new publisher
                    sql = "INSERT INTO publishers VALUES(?,?,?,?)";
                    prepStmt = conn.prepareStatement(sql);
                    prepStmt.setString(1, pubName);
                    prepStmt.setString(2, pubAddress);
                    prepStmt.setString(3, pubPhone);
                    prepStmt.setString(4, pubEmail);
                    try{
                        System.out.print("Which publisher would you like to overwrite?: "); 
                        String pubToOverwrite = in.nextLine();

                        //overwrites old publisher with new publisher 
                        sql = "UPDATE books SET pubName = ? WHERE pubName = ?";
                        //Get the publisher to be updated to check if the publisher exists
                        String sqlPub = "SELECT pubName, pubAddress, pubPhone, pubEmail, bookTitle FROM publishers NATURAL JOIN books WHERE pubName= ?";
                        prepStmt = conn.prepareStatement(sqlPub);
                        prepStmt.setString(1, pubToOverwrite);
                        rs = prepStmt.executeQuery();
                        if(rs.next()){
                            prepStmt = conn.prepareStatement(sql);
                            prepStmt.setString(1, pubName);
                            prepStmt.setString(2, pubToOverwrite);
                        }else{ 
                            System.out.println("Could not find the publisher to overwrite. Do you still want to add this new publisher?Y/N");
                            String addPub = in.nextLine();
                            if(addPub.toUpperCase().equals("Y")){
                                prepStmt.executeUpdate();
                                prepStmt.close();
                                System.out.print("Publisher has been inserted.\n");
                            }else{
                                System.out.println("Publisher was not added");
                                break;
                            }
                        }
                        try{
                            prepStmt.executeUpdate();
                            prepStmt.close();
                            System.out.print(pubToOverwrite + " has been overwritten.\n"); 
                            System.out.println();
                        }catch(SQLException exception){
                            sqlResponse(exception.getMessage());
                        }
                    }catch(SQLException exception){
                        System.out.println(exception.getMessage());
                        sqlResponse(exception.getMessage());
                    }
                    break;
                case 9:
                    //case 9: remove a book specified by the user
                    //Displays old list of books
                    System.out.println("Enter name of book to delete: ");
                    String bookName = in.nextLine();

                    sql = "DELETE FROM books WHERE bookTitle = ?";
                    prepStmt = conn.prepareStatement(sql);
                    prepStmt.setString(1, bookName);
                    try{
                    prepStmt.executeUpdate();
                    prepStmt.close();
                    System.out.println(bookName + " has been deleted.");
                    System.out.println();
                    }catch(SQLException exception){
                            sqlResponse(exception.getMessage());
                    }
                    break;
                case 10:
                    //case 10: quit
                    System.out.println("Goodbye!");
                    menu = false;
                    break;
                default: 
                    break;
                }
            }
            //Clean-up environment
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            int ERROR = se.getErrorCode();
            String STATE = se.getSQLState();
            System.out.println(ERROR);
            System.out.println(STATE);
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {
            // nothing we can do
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
    }//end main
}//end FirstExample}
