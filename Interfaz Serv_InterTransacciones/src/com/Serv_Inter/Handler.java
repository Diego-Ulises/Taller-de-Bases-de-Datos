package com.Serv_Inter;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class Handler {

    private Statement sentencia;
    private Connection conexion;
    private String user = "root";
    private String password = "germany10";
    //Create user syntax

    public Handler() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = (Connection) DriverManager.getConnection("jdbc:mysql://192.168.37.131/serv_inter", user, password);
            sentencia = (Statement) conexion.createStatement();
            //se deshabilita el modo de confirmación automática
            conexion.setAutoCommit(false);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public Handler(String user, String password) {
        this.user = user;
        this.password = password;
    }

    private void Commit() throws SQLException {
        //se indica que se deben aplicar los cambios en la base de datos
        conexion.commit();
        System.out.println("Commit");
    }

    private void Rollback() {
        try {
            //deshace todos los cambios realizados en los datos
            conexion.rollback();
            System.out.println("Rollback");
        } catch (SQLException ex1) {
            System.err.println("No se pudo deshacer" + ex1.getMessage());
        }
    }

    //Métodos Clientes
    public ArrayList<CLASECLIENTES> showClientes() {
        try {
            String qry = "SELECT * FROM Clientes;";
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASECLIENTES> lista = new ArrayList<>();
            while (rs.next()) {

                CLASECLIENTES obj = new CLASECLIENTES();
                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setNombre(rs.getString("Nombre"));
                obj.setApellidoP(rs.getString("ApellidoP"));
                obj.setApellidoM(rs.getString("ApellidoM"));
                obj.setDireccion(rs.getString("Direccion"));
                obj.setStatus(rs.getString("Status"));
                obj.setIDEMPRESA(rs.getInt("IDEMPRESA"));
                obj.setIDCOMERCIO(rs.getInt("IDCOMERCIO"));
                obj.setComercio(rs.getString("Comercio"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<CLASEREGUSUARIO> showRegUsuarios() {

        String qry = "SELECT * FROM RegistroUsuarios;";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASEREGUSUARIO> lista = new ArrayList<>();
            while (rs.next()) {

                CLASEREGUSUARIO obj = new CLASEREGUSUARIO();
                obj.setIDREGISTRO(rs.getInt("IDREGISTRO"));
                obj.setNombreUsuario(rs.getString("NombreUsuario"));
                obj.setApellidoPUsuario(rs.getString("ApellidoPUsuario"));
                obj.setApellidoMUsuario(rs.getString("ApellidoMUsuario"));
                obj.setDireccion(rs.getString("Direccion"));
                obj.setCorreo(rs.getString("Correo"));
                obj.setTelefono(rs.getString("Telefono"));
                obj.setTipoUsuario(rs.getInt("TipoUsuario"));
                obj.setContrasena(rs.getString("Contrasena"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaCliente(int NoContrato, String Nombre, String ApellidoP, String ApellidoM, String Direccion, String Status, String NombreEmpresa, int IDCOMERCIO, String Comercio) throws SQLException {
        try {
            String stmId = "SELECT IDEMPRESA FROM Empresa WHERE Nombre = '" + NombreEmpresa + "';";
            ResultSet rs = sentencia.executeQuery(stmId);
            int IDEMPRESA = 0;
            if (rs.next()) {
                CLASEEMPRESA obj = new CLASEEMPRESA();
                IDEMPRESA = rs.getInt("IDEMPRESA");
            }
            rs.close();
            String stm = "INSERT INTO Clientes (NoContrato, Nombre, ApellidoP, ApellidoM, Direccion, Status, IDEMPRESA) VALUES ('" + NoContrato + "','" + Nombre + "','" + ApellidoP + "','" + ApellidoM + "','" + Direccion + "','" + Status + "','" + IDEMPRESA + "','" + IDCOMERCIO + "','" + Comercio + "');";
            sentencia.execute(stm);
            Commit();
            String stm2 = "INSERT INTO ClienteMov (NoContrato, Fecha) VALUES ('" + NoContrato + "','" + getNow() + "');";
            sentencia.execute(stm2);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaCliente(int NoContrato) {
        String stm = "DELETE FROM Clientes WHERE NoContrato=" + NoContrato + ";";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Rollback();
        }
    }

    //Métodos Empresas
    public ArrayList<CLASEEMPRESA> showEmpresas() {
        String qry = "SELECT * FROM Empresa;";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASEEMPRESA> lista = new ArrayList<>();
            while (rs.next()) {

                CLASEEMPRESA obj = new CLASEEMPRESA();

                obj.setIDEMPRESA(rs.getInt("IDEMPRESA"));
                obj.setNombre(rs.getString("Nombre"));
                obj.setRFC(rs.getString("RFC"));

                lista.add(obj);
            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaEmpresa(int IDEMPRESA, String Nombre, String RFC) {
        String stm = "INSERT INTO Empresa (IDEMPRESA, Nombre, RFC) VALUES ('" + IDEMPRESA + "','" + Nombre + "','"+RFC+"');";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaEmpresa(int IdEmpresa) {
        String stm = "DELETE FROM Empresa WHERE IDEMPRESA=" + IdEmpresa + ";";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Rollback();
        }
    }

    //Métodos Servicios
    public ArrayList<CLASESERVICIOS> showServicios() {
        String qry = "SELECT * FROM Servicios;";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASESERVICIOS> lista = new ArrayList<>();
            while (rs.next()) {

                CLASESERVICIOS obj = new CLASESERVICIOS();

                obj.setID_TIPO(rs.getInt("ID_TIPO"));
                obj.setTipo(rs.getString("Tipo"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setNoSERIE(rs.getInt("NoSERIE"));

                lista.add(obj);
            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaServicio(int IdTipo, String Tipo, int VelDescarga, int VelSubida, int NoContrato, int NoSerie) {
        String stm = "INSERT INTO Servicios (ID_TIPO, Tipo, VelDescarga, VelSubida, NoContrato, NoSerie) VALUES ('" + IdTipo + "','" + Tipo + "','" + VelDescarga + "','" + VelSubida + "','" + NoContrato + "','" + NoSerie + "');";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaServicio(int Id_Tipo) {
        String stm = "DELETE FROM Servicios WHERE ID_TIPO=" + Id_Tipo + ";";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Rollback();
        }
    }

    //Métodos Comercio
    public ArrayList<CLASECOMERCIO> showComercios() {
        String qry = "SELECT * FROM Comercio;";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASECOMERCIO> lista = new ArrayList<>();
            while (rs.next()) {

                CLASECOMERCIO obj = new CLASECOMERCIO();

                obj.setIDCOMERCIO(rs.getInt("IDCOMERCIO"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setIdEmpresa(rs.getInt("IdEmpresa"));

                lista.add(obj);
            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaComercio(int IDCOMERCIO, String NombreComercial, String NombreEmpresa) {
        try {
            String stmId = "SELECT IDEMPRESA FROM Empresa WHERE Nombre = '" + NombreEmpresa + "';";
            ResultSet rs = sentencia.executeQuery(stmId);
            int IDEMPRESA = 0;
            if (rs.next()) {
                CLASEEMPRESA obj = new CLASEEMPRESA();
                IDEMPRESA = rs.getInt("IDEMPRESA");
            }
            rs.close();
            String stm = "INSERT INTO Comercio (IDCOMERCIO, NombreComercial, IdEmpresa) VALUES ('" + IDCOMERCIO + "','" + NombreComercial + "','" + IDEMPRESA + "');";

            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaComercio(int IdComercio, String comercio) {
        
        try {
            CallableStatement procedimiento = conexion.prepareCall("{call actualizarcomercio(?,?)}");
            procedimiento.setInt(1, IdComercio);
            procedimiento.setString(2, comercio);
            procedimiento.execute();
            
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, e);
            Rollback();
        }
    }

    //Metodos Equipo
    public ArrayList<CLASEEQUIPO> showEquipos() {
        String qry = "SELECT * FROM Equipo";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASEEQUIPO> lista = new ArrayList<>();
            while (rs.next()) {

                CLASEEQUIPO obj = new CLASEEQUIPO();
                obj.setNoSERIE(rs.getInt("NoSERIE"));
                obj.setDireccionMAC(rs.getString("DireccionMAC"));
                obj.setModelo(rs.getString("Modelo"));
                obj.setEstadoFun(rs.getString("EstadoFun"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaEquipo(int NoSERIE, String DireccionMAC, String Modelo, String Estadofun) throws SQLException {
        String stm = "INSERT INTO Equipo (NoSERIE, DireccionMAC, Modelo, EstadoFun) VALUES ('" + NoSERIE + "','" + DireccionMAC + "','" + Modelo + "','" + Estadofun + "');";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaEquipo(int NoSERIE) {
        String stm = "DELETE FROM Equipo WHERE NoSERIE=" + NoSERIE + ";";
        
        try {
            sentencia.execute(stm);
            Commit();
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Rollback();
        }
    }

    //Metodos Usuarios
    public ArrayList<CLASEUSUARIOS> showUsuarios() {
        String qry = "SELECT * FROM Usuarios";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASEUSUARIOS> lista1 = new ArrayList<>();
            while (rs.next()) {

                CLASEUSUARIOS obj1 = new CLASEUSUARIOS();
                obj1.setIDUSUARIO(rs.getInt("IDUSUARIO"));
                obj1.setNombreUsuario(rs.getString("NombreUsuario"));
                obj1.setIDMOVIMIENTO(rs.getInt("IDMOVIMIENTO"));
                lista1.add(obj1);

            }
            rs.close();
            return lista1;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaUsuario(int IDUSUARIO, String NombreUsuario, int IDMOVIMIENTO) throws SQLException {
        String stm = "INSERT INTO Usuarios (IDUSUARIO, NombreUsuario, IDMOVIMIENTO) VALUES ('" + IDUSUARIO + "','" + NombreUsuario + "','" + IDMOVIMIENTO + "');";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaUsuario(int IDUSUARIO) {
        String stm = "DELETE FROM Usuarios WHERE IDUSUARIO=" + IDUSUARIO + ";";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Rollback();
        }
    }

    //Metodos Movimientos
    public ArrayList<CLASEMOVIMIENTOS> showMovimientos() {
        String qry = "SELECT * FROM Movimientos";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASEMOVIMIENTOS> lista = new ArrayList<>();
            while (rs.next()) {

                CLASEMOVIMIENTOS obj = new CLASEMOVIMIENTOS();
                obj.setIDMOVIMIENTO(rs.getInt("IDMOVIMIENTO"));
                obj.setNoSerie(rs.getInt("NoSerie"));
                obj.setFecha(rs.getString("Fecha"));
                obj.setDireccionMAC(rs.getString("DireccionMAC"));
                obj.setIPDHCP(rs.getString("IPDHCP"));
                obj.setUsuarioPPPOE(rs.getString("UsuarioPPPOE"));
                obj.setContrasenaPPPOE(rs.getString("ContrasenaPPPOE"));
                obj.setDescripcion(rs.getString("Descripcion"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaMovimiento(int IDMOVIMIENTO, int NoSerie, String Fecha, String DireccionMAC, String IPDHCP, String UsuarioPPPOE, String ContrasenaPPPOE, String Descripcion) throws SQLException {
        String stm = "INSERT INTO Movimientos (IDMOVIMIENTO, NoSerie, Fecha, DireccionMAC, IPDHCP, UsuarioPPPOE, ContrasenaPPPOE, Descripcion) VALUES ('" + IDMOVIMIENTO + "','" + NoSerie + "','" + Fecha + "','" + DireccionMAC + "','" + IPDHCP + "','" + UsuarioPPPOE + "','" + ContrasenaPPPOE + "','" + Descripcion + "');";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaMovimientos(int IDMOVIMIENTO) {
        String stm = "DELETE FROM Movimientos WHERE IDMOVIMIENTO=" + IDMOVIMIENTO + ";";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Rollback();
        }
    }

    //Metodos Ciudades
    public ArrayList<CLASECIUDAD> showCiudades() {
        String qry = "SELECT * FROM Ciudad";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASECIUDAD> lista = new ArrayList<>();
            while (rs.next()) {

                CLASECIUDAD obj = new CLASECIUDAD();
                obj.setIDCIUDAD(rs.getInt("IDCIUDAD"));
                obj.setNombreCiudad(rs.getString("NombreCiudad"));
                obj.setEstado(rs.getInt("Estado"));

                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaCiudad(int IDCIUDAD, String NombreCiudad, String NombreEstado) {
        try {
            String stmId = "SELECT IDESTADO FROM Estado WHERE Nombre = '" + NombreEstado + "';";
            ResultSet rs = sentencia.executeQuery(stmId);
            int IdEstado = 0;
            if (rs.next()) {
                CLASEESTADO obj = new CLASEESTADO();
                IdEstado = rs.getInt("IDESTADO");
            }
            rs.close();
            String stm = "INSERT INTO Ciudad (IDCIUDAD, NombreCiudad, Estado) VALUES ('" + IDCIUDAD + "','" + NombreCiudad + "','" + IdEstado + "');";
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaCiudad(int IdCiudad) {
        String stm = "DELETE FROM Ciudad WHERE IDCIUDAD=" + IdCiudad + ";";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Rollback();
        }
    }

    //Metodos Estados
    public ArrayList<CLASEESTADO> showEstados() {
        String qry = "SELECT * FROM Estado";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASEESTADO> lista = new ArrayList<>();
            while (rs.next()) {

                CLASEESTADO obj = new CLASEESTADO();
                obj.setIDESTADO(rs.getInt("IDESTADO"));
                obj.setNombre(rs.getString("Nombre"));

                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaEstado(int IDESTADO, String Nombre) {
        String stm = "INSERT INTO Estado (IDESTADO, Nombre) VALUES ('" + IDESTADO + "','" + Nombre + "');";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaEstado(int IdEstado) {
        String stm = "DELETE FROM Estado WHERE IDESTADO=" + IdEstado + ";";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Rollback();
        }
    }

    //Metodos Zonas
    public ArrayList<CLASEZONA> showZonas() {
        String qry = "SELECT * FROM Zona;";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<CLASEZONA> lista = new ArrayList<>();
            while (rs.next()) {

                CLASEZONA obj = new CLASEZONA();

                obj.setIDZONA(rs.getInt("IDZONA"));
                obj.setLocalizacion(rs.getString("Localizacion"));
                obj.setCiudad(rs.getInt("Ciudad"));
                obj.setIDComercio(rs.getInt("IDComercio"));

                lista.add(obj);
            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void AltaZona(int IDZONA, String Localizacion, String NombreCiudad, String NombreComercio) {
        try {
            String stmId = "SELECT IDCIUDAD FROM Ciudad WHERE NombreCiudad = '" + NombreCiudad + "';";
            ResultSet rs = sentencia.executeQuery(stmId);
            int IDCIUDAD = 0;
            if (rs.next()) {
                CLASECIUDAD obj = new CLASECIUDAD();
                IDCIUDAD = rs.getInt("IDCIUDAD");
            }
            rs.close();
            String stmId2 = "SELECT IDCOMERCIO FROM Comercio WHERE NombreComercial = '" + NombreComercio + "';";
            ResultSet rs2 = sentencia.executeQuery(stmId2);
            int IDCOMERCIO = 0;
            if (rs2.next()) {
                CLASECOMERCIO obj = new CLASECOMERCIO();
                IDCOMERCIO = rs2.getInt("IDCOMERCIO");
            }
            rs2.close();
//            String stm = "INSERT INTO Zona (IDZONA, Localizacion, Ciudad, IDCOMERCIO) VALUES ('" + IDZONA + "','" + Localizacion + "','" + IDCIUDAD + "','" + IDCOMERCIO + "');";
//            sentencia.execute(stm);
            procedureZona(IDZONA, Localizacion, IDCIUDAD, IDCOMERCIO);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }

    public void BajaZona(int IdZona) {
        String stm = "DELETE FROM Zona WHERE IDZONA=" + IdZona + ";";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la eliminación");
            Rollback();
        }
    }

    //ACTUALIZACIONES
    public void UpCiudad(int IDCIUDAD, String Nombre, String ESTADO) throws SQLException {
        String stm = "UPDATE Ciudad SET IDCIUDAD='"+IDCIUDAD+"',NombreCiudad='" + Nombre + "',Estado='" + ESTADO + "' WHERE IDCIUDAD='" + IDCIUDAD + "' OR NombreCiudad='"+Nombre+"';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    public void UpMovimientos(int IDMOVIMIENTO, int NoSerie, String Fecha, String DireccionMAC, String IPDHCP, String UsuarioPPPOE, String ContrasenaPPPOE, String Desc) throws SQLException {
        String stm = "UPDATE Movimientos SET IDMOVIMIENTO='"+IDMOVIMIENTO+"', Fecha='" + Fecha + "',DireccionMAC='" + DireccionMAC + "',IPDHCP='" + IPDHCP + "',UsuarioPPPOE='" + UsuarioPPPOE + "',ContrasenaPPPOE='" + ContrasenaPPPOE + "',Descripcion='" + Desc + "' WHERE IDMOVIMIENTO='" + IDMOVIMIENTO + "' OR DireccionMAC='"+DireccionMAC+"';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    public void UpServicios(int ID_TIPO, int ID_TIPO2, String Tipo, int VelDescarga, int VelSubida, int NoContrato, int NoSerie) throws SQLException {
        String stm = "UPDATE Servicios SET ID_TIPO='"+ID_TIPO2+"',Tipo='" + Tipo + "',VelDescarga='" + VelDescarga + "',VelSubida='" + VelSubida + "',NoContrato='" + NoContrato + "',NoSerie='" + NoSerie + "' WHERE ID_TIPO='" + ID_TIPO + "';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    public void UpClientes(int NoContrato, int NoContrato2, String Nombre, String ApellidoP, String ApellidoM, String Direccion, String Status, String NombreEmpresa, int IDCOMERCIO, String Comercio) throws SQLException {
        String stm = "UPDATE Clientes SET NoContrato='"+NoContrato2+"', Nombre='" + Nombre + "',ApellidoP='" + ApellidoP + "',ApellidoM='" + ApellidoM + "',Direccion='" + Direccion + "',Status='" + Status + "',IDEMPRESA='" + NombreEmpresa + "',IDCOMERCIO='" + IDCOMERCIO + ",Comercio='" + Comercio + " WHERE NoContrato='" + NoContrato + "';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    public void UpEmpresa(int IDEMPRESA, String Nombre, String RFC) throws SQLException {
        String stm = "UPDATE Empresa SET IDEMPRESA='"+IDEMPRESA+"',Nombre='" + Nombre + "', RFC='"+ RFC +"' WHERE IDEMPRESA='" + IDEMPRESA + "' OR Nombre='"+Nombre+"';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    public void UpEquipo(int NoSerie, int NoSerie2, String DireccionMAC, String Modelo, String EstadoFun) throws SQLException {
        String stm = "UPDATE Equipo SET NoSerie='"+NoSerie2+"',Modelo='" + Modelo + "',DireccionMAC='" + DireccionMAC + "',EstadoFun='" + EstadoFun + "' WHERE NoSerie='" + NoSerie + "';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    public void UpComercio(int IDCOMERCIO, String NombreComercial, int IdEmpresa) throws SQLException {
        String stm = "UPDATE Comercio SET IDCOMERCIO='"+IDCOMERCIO+"', NombreComercial='"+ NombreComercial +"', IdEmpresa='"+ IdEmpresa +"' WHERE IDCOMERCIO='" + IDCOMERCIO + "' OR NombreComercial='"+NombreComercial+"';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, e);
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    public void UpEstado(int IDESTADO, String Nombre) throws SQLException {
        String stm = "UPDATE Estado SET IDESTADO='"+IDESTADO+"',Nombre='" + Nombre + "' WHERE IDESTADO='" + IDESTADO + "' OR Nombre='"+Nombre+"';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    public void UpZona(int IDZONA, String Localizacion, int Ciudad, int Comercio) throws SQLException {
        String stm = "UPDATE Zona SET IDZONA='"+IDZONA+"', Localizacion='" + Localizacion + "', Ciudad='" + Ciudad + "', IDCOMERCIO='" + Comercio + "' WHERE IDZONA ='" + IDZONA + "' OR Localizacion='"+Localizacion+"';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    public void UpUsuario(int IDUSUARIO, String NombreUsu, int IDMOVIMIENTO) throws SQLException {
        String stm = "UPDATE Usuarios SET IDUSUARIO='"+IDUSUARIO+"', NombreUsuario='" + NombreUsu + "', IDMOVIMIENTO='" + IDMOVIMIENTO + "' WHERE IDUSUARIO ='" + IDUSUARIO + "' OR NombreUsuario='"+NombreUsu+"';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el procedimiento");
            Rollback();
        }
    }

    //Métodos Reportes
    public ArrayList<ClaseReportAllZonas> showRepAllZonas() {
        String qry = "SELECT Zona.IDZONA, Zona.Localizacion, Empresa.Nombre, Comercio.NombreComercial, Estado.Nombre, Ciudad.Nombreciudad"
                + " FROM (((Zona INNER JOIN Comercio ON Zona.IDComercio=Comercio.IDCOMERCIO) INNER JOIN Empresa ON Empresa.IDEMPRESA=Comercio.IdEmpresa)"
                + "INNER JOIN Ciudad ON Ciudad.IDCIUDAD=Zona.Ciudad)INNER JOIN Estado ON Ciudad.Estado=Estado.IDESTADO;";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllZonas> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllZonas obj = new ClaseReportAllZonas();
                obj.setIDZONA(rs.getInt("IDZONA"));
                obj.setLocalizacion(rs.getString("Localizacion"));
                obj.setEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setEstado(rs.getString("Estado.Nombre"));
                obj.setCiudad(rs.getString("NombreCiudad"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllZonas> showRepZonasFiltroCiudad(String Empresa, String Ciudad) {
        String qry = "SELECT Zona.IDZONA, Zona.Localizacion, Empresa.Nombre, Comercio.NombreComercial, Estado.Nombre, Ciudad.Nombreciudad"
                + " FROM (((Zona INNER JOIN Comercio ON Zona.IDComercio=Comercio.IDCOMERCIO) INNER JOIN Empresa ON Empresa.IDEMPRESA=Comercio.IdEmpresa)"
                + "INNER JOIN Ciudad ON Ciudad.IDCIUDAD=Zona.Ciudad)INNER JOIN Estado ON Ciudad.Estado=Estado.IDESTADO"
                + " WHERE Empresa.Nombre='"
                + Empresa + "' AND Ciudad.Nombreciudad='"
                + Ciudad + "';";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllZonas> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllZonas obj = new ClaseReportAllZonas();
                obj.setIDZONA(rs.getInt("IDZONA"));
                obj.setLocalizacion(rs.getString("Localizacion"));
                obj.setEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setEstado(rs.getString("Estado.Nombre"));
                obj.setCiudad(rs.getString("NombreCiudad"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllZonas> showRepZonasFiltroEstado(String Empresa, String Estado) {
        String qry = "SELECT Zona.IDZONA, Zona.Localizacion, Empresa.Nombre, Comercio.NombreComercial, Estado.Nombre, Ciudad.Nombreciudad"
                + " FROM (((Zona INNER JOIN Comercio ON Zona.IDComercio=Comercio.IDCOMERCIO) INNER JOIN Empresa ON Empresa.IDEMPRESA=Comercio.IdEmpresa)"
                + "INNER JOIN Ciudad ON Ciudad.IDCIUDAD=Zona.Ciudad)INNER JOIN Estado ON Ciudad.Estado=Estado.IDESTADO"
                + " WHERE Empresa.Nombre='"
                + Empresa + "' AND Estado.Nombre='"
                + Estado + "';";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllZonas> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllZonas obj = new ClaseReportAllZonas();
                obj.setIDZONA(rs.getInt("IDZONA"));
                obj.setLocalizacion(rs.getString("Localizacion"));
                obj.setEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setEstado(rs.getString("Estado.Nombre"));
                obj.setCiudad(rs.getString("NombreCiudad"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllZonas> showRepZonasFiltroNomComer(String Empresa, String NomComer) {
        String qry = "SELECT Zona.IDZONA, Zona.Localizacion, Empresa.Nombre, Comercio.NombreComercial, Estado.Nombre, Ciudad.Nombreciudad"
                + " FROM (((Zona INNER JOIN Comercio ON Zona.IDComercio=Comercio.IDCOMERCIO) INNER JOIN Empresa ON Empresa.IDEMPRESA=Comercio.IdEmpresa)"
                + "INNER JOIN Ciudad ON Ciudad.IDCIUDAD=Zona.Ciudad)INNER JOIN Estado ON Ciudad.Estado=Estado.IDESTADO"
                + " WHERE Empresa.Nombre='"
                + Empresa + "' AND Comercio.NombreComercial='"
                + NomComer + "';";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllZonas> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllZonas obj = new ClaseReportAllZonas();
                obj.setIDZONA(rs.getInt("IDZONA"));
                obj.setLocalizacion(rs.getString("Localizacion"));
                obj.setEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setEstado(rs.getString("Estado.Nombre"));
                obj.setCiudad(rs.getString("NombreCiudad"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllClientes> showRepAllClientes() {
        String qry = "SELECT Empresa.IDEMPRESA, Comercio.NombreComercial, Empresa.Nombre, Clientes.Nombre, Clientes.ApellidoP, Clientes.ApellidoM, Movimientos.Fecha"
                + " FROM ((((Movimientos INNER JOIN Equipo ON Movimientos.NoSerie=Equipo.NOSERIE) INNER JOIN Servicios ON Equipo.NoSERIE=Servicios.NoSERIE)"
                + "INNER JOIN Clientes ON Servicios.NoContrato=Clientes.NoContrato)INNER JOIN Empresa ON Clientes.IDEMPRESA=Empresa.IDEMPRESA)INNER JOIN Comercio ON Empresa.IDEMPRESA=Comercio.IdEmpresa;";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllClientes> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllClientes obj = new ClaseReportAllClientes();
                obj.setIDEMPRESA(rs.getInt("Empresa.IDEMPRESA"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setNombre(rs.getString("Empresa.Nombre"));
                obj.setNombreCliente(rs.getString("Clientes.Nombre"));
                obj.setApellidoP(rs.getString("Clientes.ApellidoP"));
                obj.setApellidoM(rs.getString("Clientes.ApellidoM"));
                obj.setFecha(rs.getString("Fecha"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllClientes> showRepClientesFiltroNomComer(String Empresa, String NomComer) {
        String qry = "SELECT Empresa.IDEMPRESA, Comercio.NombreComercial, Empresa.Nombre, Clientes.Nombre, Clientes.ApellidoP, Clientes.ApellidoM, Movimientos.Fecha"
                + " FROM ((((Movimientos INNER JOIN Equipo ON Movimientos.NoSerie=Equipo.NOSERIE) INNER JOIN Servicios ON Equipo.NoSERIE=Servicios.NoSERIE)"
                + "INNER JOIN Clientes ON Servicios.NoContrato=Clientes.NoContrato)INNER JOIN Empresa ON Clientes.IDEMPRESA=Empresa.IDEMPRESA)INNER JOIN Comercio ON Empresa.IDEMPRESA=Comercio.IdEmpresa"
                + " WHERE Empresa.Nombre='"
                + Empresa + "' AND Comercio.NombreComercial='"
                + NomComer + "';";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllClientes> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllClientes obj = new ClaseReportAllClientes();
                obj.setIDEMPRESA(rs.getInt("Empresa.IDEMPRESA"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setNombre(rs.getString("Empresa.Nombre"));
                obj.setNombreCliente(rs.getString("Clientes.Nombre"));
                obj.setApellidoP(rs.getString("Clientes.ApellidoP"));
                obj.setApellidoM(rs.getString("Clientes.ApellidoM"));
                obj.setFecha(rs.getString("Fecha"));
                lista.add(obj);
            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllClientes> showRepClientesFiltroFecha(String FechaInicio, String FechaFinal) {
        String qry = "SELECT Empresa.IDEMPRESA, Comercio.NombreComercial, Empresa.Nombre, Clientes.Nombre, Clientes.ApellidoP, Clientes.ApellidoM, Movimientos.Fecha"
                + " FROM ((((Movimientos INNER JOIN Equipo ON Movimientos.NoSerie=Equipo.NOSERIE) INNER JOIN Servicios ON Equipo.NoSERIE=Servicios.NoSERIE)"
                + "INNER JOIN Clientes ON Servicios.NoContrato=Clientes.NoContrato)INNER JOIN Empresa ON Clientes.IDEMPRESA=Empresa.IDEMPRESA)INNER JOIN Comercio ON Empresa.IDEMPRESA=Comercio.IdEmpresa"
                + " WHERE Movimientos.Fecha BETWEEN '" + FechaInicio + "' AND '" + FechaFinal + "' ORDER BY Movimientos.Fecha ASC;";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllClientes> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllClientes obj = new ClaseReportAllClientes();
                obj.setIDEMPRESA(rs.getInt("Empresa.IDEMPRESA"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setNombre(rs.getString("Empresa.Nombre"));
                obj.setNombreCliente(rs.getString("Clientes.Nombre"));
                obj.setApellidoP(rs.getString("Clientes.ApellidoP"));
                obj.setApellidoM(rs.getString("Clientes.ApellidoM"));
                obj.setFecha(rs.getString("Fecha"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    //Vistas
    public void createViewEquiposGral() {
        try {
            Statement sentencia1 = conexion.createStatement();
            String qry = "CREATE OR REPLACE VIEW Reporte_equipos_general AS SELECT Equipo.NoSERIE, Clientes.NoContrato, Equipo.Modelo, Equipo.DireccionMAC, "
                    + "Servicios.Tipo, Servicios.VelSubida, Servicios.VelDescarga, Empresa.Nombre, Movimientos.Fecha"
                    + " FROM ((((Movimientos INNER JOIN Equipo ON Movimientos.NoSerie=Equipo.NOSERIE) INNER JOIN Servicios ON Equipo.NoSERIE=Servicios.NoSERIE)"
                    + "INNER JOIN Clientes ON Servicios.NoContrato=Clientes.NoContrato)INNER JOIN Empresa ON Clientes.IDEMPRESA=Empresa.IDEMPRESA);";
            sentencia1.executeUpdate(qry);
            System.out.println("Done");
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Reportes
    public ArrayList<ClaseReportAllEquipos> showReportViewEquiposGral() {

        String qry = "SELECT * FROM Reporte_equipos_general;";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllEquipos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllEquipos obj = new ClaseReportAllEquipos();
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setModelo(rs.getString("Modelo"));
                obj.setDirMAC(rs.getString("DireccionMAC"));
                obj.setTipo(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setEmpresa(rs.getString("Nombre"));
                obj.setFecha(rs.getString("Fecha"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllEquipos> showReportViewEquiposFiltroEquipo(String noserie) {
        String qry = "SELECT * FROM Reporte_equipos_general WHERE NoSERIE ='" + noserie + "';";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllEquipos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllEquipos obj = new ClaseReportAllEquipos();
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setModelo(rs.getString("Modelo"));
                obj.setDirMAC(rs.getString("DireccionMAC"));
                obj.setTipo(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setEmpresa(rs.getString("Nombre"));
                obj.setFecha(rs.getString("Fecha"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllEquipos> showReportViewEquiposFiltroMAC(String dirmac) {
        String qry = "SELECT * FROM Reporte_equipos_general WHERE DireccionMAC ='" + dirmac + "';";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllEquipos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllEquipos obj = new ClaseReportAllEquipos();
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setModelo(rs.getString("Modelo"));
                obj.setDirMAC(rs.getString("DireccionMAC"));
                obj.setTipo(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setEmpresa(rs.getString("Nombre"));
                obj.setFecha(rs.getString("Fecha"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllEquipos> showReportViewEquiposFiltroServicio(String servicio) {
        String qry = "SELECT * FROM Reporte_equipos_general WHERE Tipo ='" + servicio + "';";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllEquipos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllEquipos obj = new ClaseReportAllEquipos();
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setModelo(rs.getString("Modelo"));
                obj.setDirMAC(rs.getString("DireccionMAC"));
                obj.setTipo(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setEmpresa(rs.getString("Nombre"));
                obj.setFecha(rs.getString("Fecha"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllEquipos> showReportViewEquiposFiltroFechas(String Fechainicio, String Fechafinal) {
        String qry = "SELECT * FROM Reporte_equipos_general WHERE Fecha BETWEEN '" + Fechainicio + "' AND '" + Fechafinal + "' ORDER BY Fecha ASC;";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllEquipos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllEquipos obj = new ClaseReportAllEquipos();
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setModelo(rs.getString("Modelo"));
                obj.setDirMAC(rs.getString("DireccionMAC"));
                obj.setTipo(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setEmpresa(rs.getString("Nombre"));
                obj.setFecha(rs.getString("Fecha"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    //Vista contratos
    public void createViewContratosGral() {
        try {

            Statement sentencia2 = conexion.createStatement();
            String qry = "CREATE OR REPLACE VIEW Reporte_contratos_general AS SELECT Clientes.NoContrato, Clientes.Status, Empresa.Nombre, Comercio.NombreComercial, Zona.Localizacion, Servicios.Tipo, Servicios.VelDescarga, Servicios.VelSubida, Equipo.NoSERIE, Movimientos.Fecha, Movimientos.IDMOVIMIENTO "
                    + "FROM ((((((Movimientos INNER JOIN Equipo ON Movimientos.NoSerie=Equipo.NoSERIE) "
                    + "INNER JOIN Servicios ON Equipo.NOSERIE=Servicios.NoSERIE) "
                    + "INNER JOIN Clientes ON Clientes.NoContrato=Servicios.NoContrato) "
                    + "INNER JOIN Empresa ON Clientes.IDEMPRESA=Empresa.IDEMPRESA) "
                    + "INNER JOIN Comercio ON Comercio.IdEmpresa=Empresa.IDEMPRESA) "
                    + "INNER JOIN Zona ON Zona.IDComercio=Comercio.IDCOMERCIO);";
            sentencia2.executeUpdate(qry);
            System.out.println("Done");
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<ClaseReportAllContratos> showReportViewContratosGral() {

        String qry = "SELECT * FROM Reporte_contratos_general;";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllContratos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllContratos obj = new ClaseReportAllContratos();

                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setStatus(rs.getString("Status"));
                obj.setNombreEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setLocalizacionZona(rs.getString("Localizacion"));
                obj.setTipoServicio(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setFecha(rs.getString("Fecha"));
                obj.setIdMovimiento(rs.getInt("IDMOVIMIENTO"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllContratos> showRepZonasFiltroLocZona(String dataf) {
        String qry = "SELECT * FROM Reporte_contratos_general WHERE Localizacion ='" + dataf + "';";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllContratos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllContratos obj = new ClaseReportAllContratos();

                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setStatus(rs.getString("Status"));
                obj.setNombreEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setLocalizacionZona(rs.getString("Localizacion"));
                obj.setTipoServicio(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setFecha(rs.getString("Fecha"));
                obj.setIdMovimiento(rs.getInt("IDMOVIMIENTO"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllContratos> showRepZonasFiltroStatus(String dataf) {
        String qry = "SELECT * FROM Reporte_contratos_general WHERE Status ='" + dataf + "';";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllContratos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllContratos obj = new ClaseReportAllContratos();

                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setStatus(rs.getString("Status"));
                obj.setNombreEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setLocalizacionZona(rs.getString("Localizacion"));
                obj.setTipoServicio(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setFecha(rs.getString("Fecha"));
                obj.setIdMovimiento(rs.getInt("IDMOVIMIENTO"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllContratos> showRepZonasFiltroNomComer(String dataf) {
        String qry = "SELECT * FROM Reporte_contratos_general WHERE NombreComercial ='" + dataf + "';";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllContratos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllContratos obj = new ClaseReportAllContratos();

                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setStatus(rs.getString("Status"));
                obj.setNombreEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setLocalizacionZona(rs.getString("Localizacion"));
                obj.setTipoServicio(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setFecha(rs.getString("Fecha"));
                obj.setIdMovimiento(rs.getInt("IDMOVIMIENTO"));
                lista.add(obj);
            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllContratos> showRepZonasFiltroNoContrato(String dataf) {
        String qry = "SELECT * FROM Reporte_contratos_general WHERE NoContrato ='" + dataf + "';";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllContratos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllContratos obj = new ClaseReportAllContratos();

                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setStatus(rs.getString("Status"));
                obj.setNombreEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setLocalizacionZona(rs.getString("Localizacion"));
                obj.setTipoServicio(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setFecha(rs.getString("Fecha"));
                obj.setIdMovimiento(rs.getInt("IDMOVIMIENTO"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllContratos> showRepZonasFiltroEmpresa(String dataf) {
        String qry = "SELECT * FROM Reporte_contratos_general WHERE Nombre ='" + dataf + "';";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllContratos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllContratos obj = new ClaseReportAllContratos();

                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setStatus(rs.getString("Status"));
                obj.setNombreEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setLocalizacionZona(rs.getString("Localizacion"));
                obj.setTipoServicio(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setFecha(rs.getString("Fecha"));
                obj.setIdMovimiento(rs.getInt("IDMOVIMIENTO"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllContratos> showRepZonasFiltroTipoServ(String dataf) {
        String qry = "SELECT * FROM Reporte_contratos_general WHERE Tipo ='" + dataf + "';";

        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllContratos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllContratos obj = new ClaseReportAllContratos();

                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setStatus(rs.getString("Status"));
                obj.setNombreEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setLocalizacionZona(rs.getString("Localizacion"));
                obj.setTipoServicio(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setFecha(rs.getString("Fecha"));
                obj.setIdMovimiento(rs.getInt("IDMOVIMIENTO"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllContratos> showReportViewContratosFiltroFechas(String Fechainicio, String Fechafinal) {
        String qry = "SELECT * FROM Reporte_contratos_general WHERE Fecha BETWEEN '" + Fechainicio + "' AND '" + Fechafinal + "' ORDER BY Fecha ASC;";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllContratos> lista = new ArrayList<>();
            while (rs.next()) {

                ClaseReportAllContratos obj = new ClaseReportAllContratos();

                obj.setNoContrato(rs.getInt("NoContrato"));
                obj.setStatus(rs.getString("Status"));
                obj.setNombreEmpresa(rs.getString("Nombre"));
                obj.setNombreComercial(rs.getString("NombreComercial"));
                obj.setLocalizacionZona(rs.getString("Localizacion"));
                obj.setTipoServicio(rs.getString("Tipo"));
                obj.setVelSubida(rs.getInt("VelSubida"));
                obj.setVelDescarga(rs.getInt("VelDescarga"));
                obj.setNoSerie(rs.getInt("NoSERIE"));
                obj.setFecha(rs.getString("Fecha"));
                obj.setIdMovimiento(rs.getInt("IDMOVIMIENTO"));
                lista.add(obj);

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<ClaseReportAllSesiones> showReportViewSesiones() {
        String qry = "SELECT LoginUsuario.IDLOGIN, RegistroUsuarios.NombreUsuario, RegistroUsuarios.ApellidoPUsuario, RegistroUsuarios.ApellidoMUsuarios, RegistroUsuarios.TipoUsuario, LoginUsuario.FechaIngreso, LoginUsuario.FechaSalida "
                + "FROM (LoginUsuario INNER JOIN RegistroUsuarios ON LoginUsuario.IDREGISTRO=RegistroUsuarios.IDREGISTRO) "
                + "INNER JOIN TipoUsuario ON RegistroUsuarios.TipoUsuario=TipoUsuario.IDTIPO ORDER BY(IDLOGIN);";
        try {
            ResultSet rs = sentencia.executeQuery(qry);
            ArrayList<ClaseReportAllSesiones> lista = new ArrayList<>();
            System.out.println("Ahora sí");
            while (rs.next()) {

                ClaseReportAllSesiones obj = new ClaseReportAllSesiones();

                obj.setIDLOGIN(rs.getInt("LoginUsuario.IDLOGIN"));
                obj.setNombre(rs.getString("RegistroUsuarios.NombreUsuario"));
                obj.setApaterno(rs.getString("RegistroUsuarios.ApellidoPUsuario"));
                obj.setAmaterno(rs.getString("RegistroUsuarios.ApellidoMUsuarios"));
                obj.setTipoUsuario(rs.getInt("RegistroUsuarios.TipoUsuario"));
                obj.setFechaIicio(rs.getString("LoginUsuario.FechaIngreso"));
                obj.setFechaFinal(rs.getString("LoginUsuario.FechaSalida"));
                obj.setDuracion(0);

                lista.add(obj);
                //System.out.println("Ahora sí");

            }
            rs.close();
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public String Duracion(int IDLOGIN) {
        String dur = "";
        try {
            String stm = "SELECT CONCAT( TIMESTAMPDIFF(DAY, FechaIngreso, FechaSalida), ' dias, ', MOD(TIMESTAMPDIFF(HOUR, FechaIngreso, FechaSalida), 24), ' horas y ', MOD(TIMESTAMPDIFF(MINUTE, FechaIngreso, FechaSalida), 60), ' minutos ' ) AS Duracion FROM LoginUsuario WHERE IDLOGIN='" + IDLOGIN + "';";
            ResultSet rs = sentencia.executeQuery(stm);

            while (rs.next()) {
                dur = rs.getString("Duracion");
                break;
            }
            rs.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error");
            e.printStackTrace();
        }
        System.out.println(dur);
        return dur;
    }

    public void UpdateLoginUsuario(String FechaSalida) throws SQLException {
        String stmId = "SELECT MAX(IDLOGIN) AS MAXIDLOGIN FROM LoginUsuario ;";
        ResultSet rs = sentencia.executeQuery(stmId);
        int IDLOGIN = 0;
        if (rs.next()) {
            Login_Usuario obj = new Login_Usuario();
            IDLOGIN = rs.getInt("MAXIDLOGIN");
        }
        rs.close();

        String stm = "UPDATE LoginUsuario SET FechaSalida='" + FechaSalida + "' WHERE IDLOGIN='" + IDLOGIN + "';";
        try {
            sentencia.execute(stm);
            Commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }
    
    public static java.sql.Timestamp getNow() {
        java.util.Calendar calendarHoy = Calendar.getInstance();
        java.util.Date hoy = calendarHoy.getTime();
        Timestamp hoySql = new Timestamp(hoy.getTime());
        //System.out.println("Hoy es: " + hoySql);
        String DateTime = hoySql.toString();
        return hoySql;
    }
    
    public void MovCliente(int NoContrato) {
         try {
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la inserción");
            e.printStackTrace();
            Rollback();
        }
    }
    
     CallableStatement cStmt; 
    
    //int IDZONA, String Localizacion, String NombreCiudad, String NombreComercio
    private void procedureZona(int IDZONA, String Localizacion, int Ciudad, int IDECOMERCIO) throws SQLException{
        
        cStmt = conexion.prepareCall("{call procedure_insert_zona (?,?,?,?)}");
        System.out.println("yy");
        cStmt.setInt(1,IDZONA);
        cStmt.setString(2, Localizacion);
        cStmt.setInt(3, Ciudad);
        cStmt.setInt(4,IDECOMERCIO);
        System.out.println("zz");
//        cStmt.registerOutParameter("inOutParam", Types.INTEGER);
        cStmt.execute();
        System.out.println("xx");
        final ResultSet rs = cStmt.getResultSet();
        System.out.println("ff");
//        while(rs.next()){
//            System.out.println("Cadena de caracteres pasada como prametro de entrada = "+rs.getString("inputParam"));
//        }
//        
//        int outputValue = cStmt.getInt("inOutParam");
//        System.out.println("Parametro de salida incrementado = "+outputValue);
    }
}
