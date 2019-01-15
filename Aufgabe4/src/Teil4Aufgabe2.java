import java.io.*;
import java.sql.*;

public class Teil4Aufgabe2 {
    public static void main(String args[]) {

        String kundeEmail = "xy";
        int ferienwohnungID = 0;
        String anreisetermin = "11/01/2018"; // "11/01/2018"
        String abreisetermin = "11/21/2018"; // "11/21/2018"
        String name = "dbsys61";
        String passwd = "Schlagzeug1997";
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        Connection conn = null;
        Statement stmt = null;
        Statement stmt1 = null;
        Statement stmt2 = null;
        ResultSet rset = null;

       /* try {
            System.out.println("KundenEmail: ");
            kundeEmail = in.readLine();
            System.out.println("FerienwohnungID:");
            ferienwohnungID = in.readLine();
            System.out.println("Anreisetermin(MM/DD/YYYY):");
            anreisetermin = in.readLine();
            System.out.println("Abreisetermin(MM/DD/YYYY):");
            abreisetermin = in.readLine();
        } catch (IOException e) {
            System.out.println("Fehler beim Lesen der Eingabe: " + e);
            System.exit(-1);
        }
*/
        System.out.println("");

        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver()); 				// Treiber laden
            String url = "jdbc:oracle:thin:@oracle12c.in.htwg-konstanz.de:1521:ora12c"; // String für DB-Connection
            conn = DriverManager.getConnection(url, name, passwd); 						// Verbindung erstellen

            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE); 			// Transaction Isolations-Level setzen
            conn.setAutoCommit(false);													// Kein automatisches Commit

            stmt = conn.createStatement(); 												// Statement-Objekt erzeugen
            stmt1 = conn.createStatement();
            stmt2 = conn.createStatement();


            String mySelectQuery = "CREATE VIEW Buchungen(Ferienwohnung)\n" +
                    "AS SELECT f.fw_ID\n" +
                    "FROM dbsys61.Ferienwohnung f,dbsys61.Buchung B\n" +
                    "WHERE b.buchung_Von > TO_DATE('"+ anreisetermin + "', 'MM/DD/YYYY')\n" +
                    "AND b.buchung_Von < TO_DATE('"+ abreisetermin + "', 'MM/DD/YYYY')\n" +
                    "AND b.buchung_Bis > TO_DATE('"+ anreisetermin + "', 'MM/DD/YYYY')\n" +
                    "AND b.buchung_Bis < TO_DATE('"+ abreisetermin + "', 'MM/DD/YYYY')\n" +
                    "AND f.fw_ID = b.fw_ID\n";
            rset = stmt2.executeQuery(mySelectQuery);
            while (rset.next()) {
                if (rset.getInt("Ferienwohnung") == ferienwohnungID) {
                    System.out.println("Bereits Gebucht!!");
                    try {
                        conn.rollback();														// Rollback durchführen
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    System.exit(-1);
                }
            }

            mySelectQuery = "DROP VIEW Buchungen";
            stmt2.executeQuery(mySelectQuery);
            /*mySelectQuery = "SELECT COUNT(*) AS Number FROM Buchung";
            ResultSet test = stmt.executeQuery(mySelectQuery);
            int test2 = 0;
            while (test.next()) {
                test2 = test.getInt("Number");
            }
            String myUpdateQuery = "INSERT INTO Buchung VALUES(" + test2 + "," + "CURRENT_DATE," +
                    " TO_DATE('" + anreisetermin + "', 'MM/DD/YYYY')," +
                    " TO_DATE('" + abreisetermin + "', 'MM/DD/YYYY'), 0, CURRENT_DATE, " + test2 + ", 500, CURRENT_DATE,'" + kundeEmail + "','"+ ferienwohnungID + "')";
            stmt1.executeUpdate(myUpdateQuery);

            while(rset.next()) {
                System.out.println(rset.getInt("pnr"));
            }

           /* myUpdateQuery = "DELETE FROM pers WHERE pnr = '124'";
            stmt.executeUpdate(myUpdateQuery);											// Mitarbeiter wieder löschen
            */
            stmt.close();																// Verbindung trennen
            conn.commit();
            conn.close();
        } catch (SQLException se) {														// SQL-Fehler abfangen
            System.out.println();
            System.out
                    .println("SQL Exception occurred while establishing connection to DBS: "
                            + se.getMessage());
            System.out.println("- SQL state  : " + se.getSQLState());
            System.out.println("- Message    : " + se.getMessage());
            System.out.println("- Vendor code: " + se.getErrorCode());
            System.out.println();
            System.out.println("EXITING WITH FAILURE ... !!!");
            System.out.println();
            try {
                conn.rollback();														// Rollback durchführen
            } catch (SQLException e) {
                e.printStackTrace();
            }
            System.exit(-1);
        }
    }
}