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
public class RegistroUsuarios {
    int IDREGISTRO, Telefono, TipoUsuario;
    String NombreUsuario, ApellidoPUsuario, ApellidoMUsuario, Direccion, Correo;

    public int getIDREGISTRO() {
        return IDREGISTRO;
    }

    public void setIDREGISTRO(int IDREGISTRO) {
        this.IDREGISTRO = IDREGISTRO;
    }

    public int getTelefono() {
        return Telefono;
    }

    public void setTelefono(int Telefono) {
        this.Telefono = Telefono;
    }

    public int getTipoUsuario() {
        return TipoUsuario;
    }

    public void setTipoUsuario(int TipoUsuario) {
        this.TipoUsuario = TipoUsuario;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

    public String getApellidoPUsuario() {
        return ApellidoPUsuario;
    }

    public void setApellidoPUsuario(String ApellidoPUsuario) {
        this.ApellidoPUsuario = ApellidoPUsuario;
    }

    public String getApellidoMUsuario() {
        return ApellidoMUsuario;
    }

    public void setApellidoMUsuario(String ApellidoMUsuario) {
        this.ApellidoMUsuario = ApellidoMUsuario;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }
    
}
