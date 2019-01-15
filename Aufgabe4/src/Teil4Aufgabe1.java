import java.io.*;
import java.sql.*;

public class Teil4Aufgabe1 {
    public static void main(String args[]) {

        String land = null; // "Spain"
        String Anreisetermin = null; // "11/01/2018"
        String Abreisetermin = null; // "11/21/2018"
        String Austattung = null; // "Sauna"
        String name = "dbsys61";
        String passwd = "Schlagzeug1997";
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        Connection conn = null;
        Statement stmt = null;
        Statement stmt2 = null;
        Statement stmt3 = null;
        Statement stmt4 = null;
        ResultSet rset = null;

        try {
            System.out.println("Land: ");
            land = in.readLine();
            System.out.println("Anreisetermin(MM/DD/YYYY):");
            Anreisetermin = in.readLine();
            System.out.println("Abreisetermin(MM/DD/YYYY): ");
            Abreisetermin = in.readLine();
            System.out.println("Austattung(Optional): ");
            Austattung = in.readLine();
        } catch (IOException e) {
            System.out.println("Fehler beim Lesen der Eingabe: " + e);
            System.exit(-1);
        }

        System.out.println("");

        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver()); 				// Treiber laden
            String url = "jdbc:oracle:thin:@oracle12c.in.htwg-konstanz.de:1521:ora12c"; // String für DB-Connection
            conn = DriverManager.getConnection(url, name, passwd); 						// Verbindung erstellen

            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE); 			// Transaction Isolations-Level setzen
            conn.setAutoCommit(false);													// Kein automatisches Commit

            stmt = conn.createStatement(); 												// Statement-Objekt erzeugen
            stmt2 = conn.createStatement();
            stmt3 = conn.createStatement();
            stmt4 = conn.createStatement();
            //String myUpdateQuery = "INSERT INTO Land VALUES ('Germany')";				// Mitarbeiter hinzufügen
            //stmt.executeUpdate(myUpdateQuery);

            if (Austattung != null) {
                String mySelectQuery = "CREATE VIEW FerienwohnungSpanien(Ferienwohnung)\n" +
                        "AS SELECT f.fw_name\n" +
                        "FROM dbsys61.Ferienwohnung F JOIN dbsys61.hat H\n" +
                        "ON f.fw_ID = h.fw_ID\n" +
                        "AND h.austattung_name = '" + Austattung + "'\n" +
                        "AND f.land_name = '" + land + "'";
                stmt.executeQuery(mySelectQuery);
                mySelectQuery = "CREATE VIEW Buchungen(Ferienwohnung)\n" +
                        "AS SELECT f.fw_name\n" +
                        "FROM dbsys61.Ferienwohnung f,dbsys61.Buchung B,FerienwohnungSpanien FS\n" +
                        "WHERE b.buchung_Von > TO_DATE('"+ Anreisetermin + "', 'MM/DD/YYYY')\n" +
                        "AND b.buchung_Von < TO_DATE('"+ Abreisetermin + "', 'MM/DD/YYYY')\n" +
                        "AND b.buchung_Bis > TO_DATE('"+ Anreisetermin + "', 'MM/DD/YYYY')\n" +
                        "AND b.buchung_Bis < TO_DATE('"+ Abreisetermin + "', 'MM/DD/YYYY')\n" +
                        "AND f.fw_name = FS.ferienwohnung\n" +
                        "AND f.fw_ID = b.fw_ID\n";
                stmt2.executeQuery(mySelectQuery);
                mySelectQuery = "CREATE VIEW Sterne(Sterne,Ferienwohnung) AS\n" +
                        "SELECT AVG(b.buchung_sterne) as Sterne,FS.ferienwohnung\n" +
                        "FROM dbsys61.Buchung B,FerienwohnungSpanien FS RIGHT OUTER JOIN dbsys61.Ferienwohnung F\n" +
                        "ON f.fw_name = fs.ferienwohnung\n" +
                        "WHERE fs.ferienwohnung NOT IN (SELECT * FROM Buchungen VB) \n" +
                        "AND b.fw_ID = f.fw_ID\n" +
                        "GROUP BY FS.ferienwohnung\n" +
                        "ORDER BY Sterne DESC";
                stmt3.executeQuery(mySelectQuery);
               mySelectQuery = "SELECT * FROM Sterne";
               rset = stmt4.executeQuery(mySelectQuery);
               mySelectQuery = "DROP VIEW FerienwohnungSpanien";
               stmt.executeQuery(mySelectQuery);
               mySelectQuery = "DROP VIEW Buchungen";
               stmt2.executeQuery(mySelectQuery);
               mySelectQuery = "DROP VIEW Sterne";
               stmt3.executeQuery(mySelectQuery);
               // Query ausführen
            } else {
                 String mySelectQuery = "CREATE VIEW FerienwohnungSpanien(Ferienwohnung)\n" +
                        "AS SELECT f.fw_name\n" +
                        "FROM dbsys61.Ferienwohnung F\n" +
                        "WHERE f.land_name = '" + land + "'";
                stmt.executeQuery(mySelectQuery);
                mySelectQuery = "CREATE VIEW Buchungen(Ferienwohnung)\n" +
                        "AS SELECT f.fw_name\n" +
                        "FROM dbsys61.Ferienwohnung f,dbsys61.Buchung B,FerienwohnungSpanien FS\n" +
                        "WHERE b.buchung_Von > TO_DATE('"+ Anreisetermin + "', 'MM/DD/YYYY')\n" +
                        "AND b.buchung_Von < TO_DATE('"+ Abreisetermin + "', 'MM/DD/YYYY')\n" +
                        "AND b.buchung_Bis > TO_DATE('"+ Anreisetermin + "', 'MM/DD/YYYY')\n" +
                        "AND b.buchung_Bis < TO_DATE('"+ Abreisetermin + "', 'MM/DD/YYYY')\n" +
                        "AND f.fw_name = FS.ferienwohnung\n" +
                        "AND f.fw_ID = b.fw_ID\n";
                stmt2.executeQuery(mySelectQuery);
                mySelectQuery = "CREATE VIEW Sterne(Sterne,Ferienwohnung) AS\n" +
                        "SELECT AVG(b.buchung_sterne) as Sterne,FS.ferienwohnung\n" +
                        "FROM dbsys61.Buchung B,FerienwohnungSpanien FS RIGHT OUTER JOIN dbsys61.Ferienwohnung F\n" +
                        "ON f.fw_name = fs.ferienwohnung\n" +
                        "WHERE fs.ferienwohnung NOT IN (SELECT * FROM Buchungen VB) \n" +
                        "AND b.fw_ID = f.fw_ID\n" +
                        "GROUP BY FS.ferienwohnung\n" +
                        "ORDER BY Sterne DESC";
                stmt3.executeQuery(mySelectQuery);
                mySelectQuery = "SELECT * FROM Sterne";
                rset = stmt4.executeQuery(mySelectQuery);
                mySelectQuery = "DROP VIEW FerienwohnungSpanien";
                stmt.executeQuery(mySelectQuery);
                mySelectQuery = "DROP VIEW Buchungen";
                stmt2.executeQuery(mySelectQuery);
                mySelectQuery = "DROP VIEW Sterne";
                stmt3.executeQuery(mySelectQuery);                             // Query ausführen
            }

            while(rset.next()) {
                System.out.println(rset.getInt("Sterne") + " "
                                    + rset.getString("Ferienwohnung"));
            }
            //myUpdateQuery = "DELETE FROM pers WHERE pnr = '124'";
            //stmt.executeUpdate(myUpdateQuery);											// Mitarbeiter wieder löschen

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
