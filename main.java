import java.sql.*;
import java.util.Scanner;

/**
 *
 * @author Mimi Opkins with some tweaking from Dave Brown
 */
public class JDBC {
    //  Database credentials
//    static String USER;
//    static String PASS;
    static String DBNAME;
    //This is the specification for the printout that I'm doing:
    //each % denotes the start of a new field.
    //The - denotes left justification.
    //The number indicates how wide to make the field.
    //The "s" denotes that it's a string.  All of our output in this test are 
    //strings, but that won't always be the case.
    static final String displayFormat="%-25s%-50s%-25s%-15s\n";
    static final String displayFormatUserGroup="%-25s%-25s%-25s%-25s%-25s%-25s\n";
// JDBC driver name and database URL
    static final String JDBC_DRIVER = "org.apache.derby.jdbc.ClientDriver";
    static String DB_URL = "jdbc:derby://localhost:1527/";
//            + "testdb;user=";
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

    public static void main(String[] args) {
        //Prompt the user for the database name, and the credentials.
        //If your database has no credentials, you can update this code to 
        //remove that from the connection string.
        Scanner in = new Scanner(System.in);
        System.out.print("Name of the database (not the user account): ");
        DBNAME = in.nextLine();
//        System.out.print("Database user name: ");
//        USER = in.nextLine();
//        System.out.print("Database password: ");
//        PASS = in.nextLine();
        //Constructing the database URL connection string
//        DB_URL = DB_URL + DBNAME + ";user="+ USER + ";password=" + PASS;
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
                mainMenu();
                int user_input = inputValidation(in);
                switch(user_input){
                case 1:
                    //case 1: list all writing groups
                    sql = "SELECT * FROM writingGroups";
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
                    sql = "SELECT * FROM writingGroups NATURAL JOIN publishers NATURAL JOIN books WHERE groupName= ?";
                    System.out.println("Select Group Name:\n");
                    String group = in.nextLine();
                    prepStmt = conn.prepareStatement(sql);
                        prepStmt.setString(1, group);
                        rs = prepStmt.executeQuery();
                        System.out.printf(displayFormatUserGroup, "Group Name", "Head Writer", "Year Formed", "Subject", "Title", "Publisher Name");
                        while (rs.next()) {
                            String name = rs.getString("groupName");
                            String head = rs.getString("headWriter");
                            String year = rs.getString("yearFormed");
                            String subject = rs.getString("subject");
                            String title = rs.getString("bookTitle");
                            String pubName = rs.getString("pubName");
                            //Display values
                            System.out.printf(displayFormatUserGroup,
                            dispNull(name), dispNull(head), dispNull(year), dispNull(subject), dispNull(title), dispNull(pubName));
                        }
                    break;
                case 3:
                    //case 3: list all publishers
                    sql = "SELECT * FROM publishers";
                    rs = stmt.executeQuery(sql);
                    System.out.printf(displayFormat, "NAME", "ADDRESS", "PHONE", "EMAIL");
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
                    break;
                case 5:
                    //case 5: list all book titles
                    sql = "SELECT * FROM books";
                    rs = stmt.executeQuery(sql);
                    System.out.printf(displayFormat, "WRITING GROUP", "TITLE", "PUBLISHER NAME", "NUMBER OF PAGES");
                    while (rs.next()) {
                        //Retrieve by column name
                        String name = rs.getString("groupName");
                        String title = rs.getString("bookTitle");
                        String pubName = rs.getString("pubName");
                        String numPages = rs.getString("numOfPages");
                        //Display values
                        System.out.printf(displayFormat, 
                                dispNull(name), dispNull(title), dispNull(pubName), dispNull(numPages));
                        }
                    System.out.println("\n");
                    rs.close();
                    break;
                case 6:
                    //case 6: list all the data for a book specified by the user
                    break;
                case 7:
                    //case 7: insert a new book
                    break;
                case 8:
                    //case 8: insert a new publisher and update all books published by one publisher to be published by the new publisher. 
                    //        leave the old publisher alone, just modify the books that they have published. 
                    //        assume that the new publisher has bought out the old one, so now any books published by the old publisher are published by the new one.
                    break;
                case 9:
                    //case 9: remove a book specified by the user
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
            //switch statement from user
            
            //Clean-up environment
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
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
            }// nothing we can do
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
