/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Serv_Inter;

/**
 *
 * @author Migue
 */
public class ClaseReportAllSesiones {
    String Nombre, Apaterno, Amaterno, Usuario, FechaIicio, FechaFinal;
    int IDLOGIN, duracion, TipoUsuario;

    public int getIDLOGIN() {
        return IDLOGIN;
    }

    public void setIDLOGIN(int IDLOGIN) {
        this.IDLOGIN = IDLOGIN;
    }

    public int getTipoUsuario() {
        return TipoUsuario;
    }

    public void setTipoUsuario(int TipoUsuario) {
        this.TipoUsuario = TipoUsuario;
    }


    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApaterno() {
        return Apaterno;
    }

    public void setApaterno(String Apaterno) {
        this.Apaterno = Apaterno;
    }

    public String getAmaterno() {
        return Amaterno;
    }

    public void setAmaterno(String Amaterno) {
        this.Amaterno = Amaterno;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getFechaIicio() {
        return FechaIicio;
    }

    public void setFechaIicio(String FechaIicio) {
        this.FechaIicio = FechaIicio;
    }

    public String getFechaFinal() {
        return FechaFinal;
    }

    public void setFechaFinal(String FechaFinal) {
        this.FechaFinal = FechaFinal;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }
    
    
}
