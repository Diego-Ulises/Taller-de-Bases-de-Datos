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
public class Login_Sesion {
    int IDINGRESO, Usuario;
    String FechaIngreso, FechaSalida;

    public int getIDINGRESO() {
        return IDINGRESO;
    }

    public void setIDINGRESO(int IDINGRESO) {
        this.IDINGRESO = IDINGRESO;
    }

    public int getUsuario() {
        return Usuario;
    }

    public void setUsuario(int Usuario) {
        this.Usuario = Usuario;
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
