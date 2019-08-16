package com.Serv_Inter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import javax.swing.JOptionPane;

/**
 *
 * @author Diego Ulises
 */
public class Conexion {

    private Statement sentencia;
    private Connection conexion;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = (Connection) DriverManager.getConnection("jdbc:mysql://192.168.37.131/serv_inter", "root", "germany10");
            sentencia = (Statement) conexion.createStatement();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public void RegistroUsuario(String name, String text, String text0, String text1, String text2, String text3, int TipoU) {
        try {
            //se deshabilita el modo de confirmación automática
            conexion.setAutoCommit(false);
            String stm = "INSERT INTO RegistroUsuarios (NombreUsuario, ApellidoPUsuario, ApellidoMUsuarios, Direccion, Correo, Telefono, TipoUsuario) VALUES ('" + name + "','" + text + "','" + text0 + "','" + text1 + "','" + text2 + "','" + text3 + "','" + TipoU + "');";
            sentencia.execute(stm);
            //se indica que se deben aplicar los cambios en la base de datos
            conexion.commit();
            System.out.println("Commit");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el registro");
            e.printStackTrace();
            System.out.println("Rollback");
            try {
                //deshace todos los cambios realizados en los datos
                conexion.rollback();
            } catch (SQLException ex1) {
                System.err.println("No se pudo deshacer" + ex1.getMessage());
            }
        }
    }

    public void Transacciones() {
        try {
            //se deshabilita el modo de confirmación automática
            conexion.setAutoCommit(false);

            //se indica que se deben aplicar los cambios en la base de datos
            conexion.commit();
            System.out.println("Commit");
        } catch (Exception e) {
            try {
                //deshace todos los cambios realizados en los datos
                conexion.rollback();
                System.out.println("Rollback");
            } catch (SQLException ex1) {
                System.err.println("No se pudo deshacer" + ex1.getMessage());
            }
        }
    }

    public int Login(String NombreUsuario) {
        int TipoUser = 0;
        try {
            //se deshabilita el modo de confirmación automática
            String stm = "SELECT TipoUsuario FROM RegistroUsuarios WHERE NombreUsuario='" + NombreUsuario + "';";
            ResultSet rs = sentencia.executeQuery(stm);

            while (rs.next()) {
                TipoUser = rs.getInt("TipoUsuario");
                break;
            }
            rs.close();
            //se indica que se deben aplicar los cambios en la base de datos
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error");
            e.printStackTrace();
            
        }
        System.out.println(TipoUser);
        return TipoUser;
    }

    public int IdReg(String user) {
        int IDREGISTRO = 0;
        try {
            //se deshabilita el modo de confirmación automática
            conexion.setAutoCommit(false);
            String stm = "SELECT IDREGISTRO FROM RegistroUsuarios WHERE NombreUsuario='" + user + "';";
            ResultSet rs = sentencia.executeQuery(stm);

            while (rs.next()) {
                IDREGISTRO = rs.getInt("IDREGISTRO");
                break;
            }
            rs.close();
            //se indica que se deben aplicar los cambios en la base de datos
            conexion.commit();
            System.out.println("Commit");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error");
            e.printStackTrace();
            try {
                //deshace todos los cambios realizados en los datos
                conexion.rollback();
                System.out.println("Rollback");
            } catch (SQLException ex1) {
                System.err.println("No se pudo deshacer" + ex1.getMessage());
            }
        }
        System.out.println(IDREGISTRO);
        return IDREGISTRO;
    }

    public void LoginUsuario(String NombreUsuario, String FechaIngreso, String FechaSalida, int IDREGISTRO) throws SQLException {
        try {
            //se deshabilita el modo de confirmación automática
            conexion.setAutoCommit(false);
            String stm = "INSERT INTO LoginUsuario (NombreUsuario, FechaIngreso, FechaSalida, IDREGISTRO) VALUES ('" + NombreUsuario + "','" + FechaIngreso + "','" + FechaSalida + "','" + IDREGISTRO + "');";
            sentencia.execute(stm);
            //se indica que se deben aplicar los cambios en la base de datos
            conexion.commit();
            System.out.println("Commit");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            try {
                //deshace todos los cambios realizados en los datos
                conexion.rollback();
                System.out.println("Rollback");
            } catch (SQLException ex1) {
                System.err.println("No se pudo deshacer" + ex1.getMessage());
            }
        }
    }

    public String Duracion(int IDREGISTRO) {
        String dur = "";
        try {
            //se deshabilita el modo de confirmación automática
            conexion.setAutoCommit(false);
            String stm = "SELECT CONCAT( TIMESTAMPDIFF(DAY, FechaIngreso, FechaSalida), ' dias, ', MOD(TIMESTAMPDIFF(HOUR, FechaIngreso, FechaSalida), 24), ' horas y ', MOD(TIMESTAMPDIFF(MINUTE, FechaIngreso, FechaSalida), 60), ' minutos ' ) AS Duracion FROM LoginUsuario WHERE IDREGISTRO='" + IDREGISTRO + "';";
            ResultSet rs = sentencia.executeQuery(stm);

            while (rs.next()) {
                dur = rs.getString("Duracion");
                break;
            }
            rs.close();
            //se indica que se deben aplicar los cambios en la base de datos
            conexion.commit();
            System.out.println("Commit");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error");
            e.printStackTrace();
            try {
                //deshace todos los cambios realizados en los datos
                conexion.rollback();
                System.out.println("Rollback");
            } catch (SQLException ex1) {
                System.err.println("No se pudo deshacer" + ex1.getMessage());
            }
        }
        System.out.println(dur);
        return dur;
    }
}
