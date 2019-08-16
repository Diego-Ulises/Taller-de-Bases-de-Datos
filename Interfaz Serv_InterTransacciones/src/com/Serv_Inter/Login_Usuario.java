/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Serv_Inter;

/**
 *
 * @author Diego Ulises
 */
public class Login_Usuario {
    int IDLOGIN, IDREGISTRO;
    String NombreUsuario, FechaIngreso, FechaSalida;

    public int getIDLOGIN() {
        return IDLOGIN;
    }

    public void setIDLOGIN(int IDLOGIN) {
        this.IDLOGIN = IDLOGIN;
    }

    public int getIDREGISTRO() {
        return IDREGISTRO;
    }

    public void setIDREGISTRO(int IDREGISTRO) {
        this.IDREGISTRO = IDREGISTRO;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

    public String getFechaIngreso() {
        return FechaIngreso;
    }

    public void setFechaIngreso(String FechaIngreso) {
        this.FechaIngreso = FechaIngreso;
    }

    public String getFechaSalida() {
        return FechaSalida;
    }

    public void setFechaSalida(String FechaSalida) {
        this.FechaSalida = FechaSalida;
    }
    
}
