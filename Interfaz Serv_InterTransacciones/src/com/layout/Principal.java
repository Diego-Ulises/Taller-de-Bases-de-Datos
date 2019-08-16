package com.layout;

import com.Serv_Inter.CLASECIUDAD;
import com.Serv_Inter.CLASECLIENTES;
import com.Serv_Inter.CLASECOMERCIO;
import com.Serv_Inter.CLASEEMPRESA;
import com.Serv_Inter.CLASEEQUIPO;
import com.Serv_Inter.CLASEESTADO;
import com.Serv_Inter.CLASEMOVIMIENTOS;
import com.Serv_Inter.CLASESERVICIOS;
import com.Serv_Inter.CLASEUSUARIOS;
import com.Serv_Inter.CLASEZONA;
import javax.swing.JOptionPane;
import com.Serv_Inter.Handler;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.DefaultTableModel;

public class Principal extends javax.swing.JFrame {

    private ArrayList<CLASECLIENTES> clientes;
    private ArrayList<CLASEEMPRESA> empresas;
    private ArrayList<CLASESERVICIOS> servicios;
    private ArrayList<CLASECOMERCIO> comercios;
    private ArrayList<CLASEEQUIPO> equipos;
    private ArrayList<CLASEUSUARIOS> usuarios;
    private ArrayList<CLASEMOVIMIENTOS> movimientos;
    private ArrayList<CLASEESTADO> estados;
    private ArrayList<CLASECIUDAD> ciudades;
    private ArrayList<CLASEZONA> zonas;
    private static Handler handler;

    private int tipoUsuario;

    Principal(String user, String password) {
        handler = new Handler(user, password);
    }

    Principal(int tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
        initComponents();
        handler = new Handler();
        updateArrays();
        updateClientes();
        updateEmpresas();
        updateServicios();
        updateComercios();
        updateEquipos();
        updateUsuarios();
        updateMovimientos();
        updateEstados();
        updateCiudades();
        updateZonas();
        this.setLocationRelativeTo(null);
        if (tipoUsuario == 1) {
            jMenuClientes.setEnabled(true);
            jMenuEmpresa.setEnabled(true);
            jMenuServicios.setEnabled(true);
            jMenuComercios.setEnabled(true);
            jMenuEquipos.setEnabled(true);
            jMenuUsuarios.setEnabled(true);
            jMenuMovimientos.setEnabled(true);
            jMenuZona.setEnabled(true);
            jMenuCiudad.setEnabled(true);
            jMenuEstados.setEnabled(true);
            jMenuReportes.setEnabled(true);

        } else if (tipoUsuario == 2) {
            jMenuClientes.setEnabled(true);
            jMenuEmpresa.setEnabled(false);
            jMenuServicios.setEnabled(false);
            jMenuComercios.setEnabled(false);
            jMenuEquipos.setEnabled(true);
            jMenuUsuarios.setEnabled(false);
            jMenuMovimientos.setEnabled(false);
            jMenuZona.setEnabled(false);
            jMenuCiudad.setEnabled(false);
            jMenuEstados.setEnabled(false);
            jMenuReportes.setEnabled(true);

        } else if (tipoUsuario == 3) {
            jMenuClientes.setEnabled(false);
            jMenuEmpresa.setEnabled(false);
            jMenuServicios.setEnabled(false);
            jMenuComercios.setEnabled(false);
            jMenuEquipos.setEnabled(false);
            jMenuUsuarios.setEnabled(false);
            jMenuMovimientos.setEnabled(false);
            jMenuZona.setEnabled(false);
            jMenuCiudad.setEnabled(false);
            jMenuEstados.setEnabled(false);
            jMenuReportes.setEnabled(true);
        }
    }
    private void updateArrays() {
        clientes = handler.showClientes();
        empresas = handler.showEmpresas();
        servicios = handler.showServicios();
        comercios = handler.showComercios();
        equipos = handler.showEquipos();
        usuarios = handler.showUsuarios();
        movimientos = handler.showMovimientos();
        estados = handler.showEstados();
        ciudades = handler.showCiudades();
        zonas = handler.showZonas();
    }

    private void updateClientes() {
        jComboBoxClientes.removeAllItems();
        for (int i = 0; i < clientes.size(); i++) {
            CLASECLIENTES tmp = clientes.get(i);
            jComboBoxClientes.addItem("" + tmp.getNombre());
        }
        jComboBoxClientes.updateUI();
    }

    private void updateEmpresas() {
        jComboBoxEmpresas.removeAllItems();
        for (int i = 0; i < empresas.size(); i++) {
            CLASEEMPRESA tmp = empresas.get(i);
            jComboBoxEmpresas.addItem("" + tmp.getNombre());
        }
        jComboBoxEmpresas.updateUI();
    }

    private void updateServicios() {
        jComboBoxServicios.removeAllItems();
        for (int i = 0; i < servicios.size(); i++) {
            CLASESERVICIOS tmp = servicios.get(i);
            jComboBoxServicios.addItem("" + tmp.getTipo());
        }
        jComboBoxServicios.updateUI();
    }

    private void updateComercios() {
        jComboBoxComercios.removeAllItems();
        for (int i = 0; i < comercios.size(); i++) {
            CLASECOMERCIO tmp = comercios.get(i);
            jComboBoxComercios.addItem("" + tmp.getNombreComercial());
        }
        jComboBoxComercios.updateUI();
    }

    private void updateEquipos() {
        jComboBoxEquipos.removeAllItems();
        for (int i = 0; i < equipos.size(); i++) {
            CLASEEQUIPO tmp = equipos.get(i);
            jComboBoxEquipos.addItem("" + tmp.getModelo());
        }
        jComboBoxEquipos.updateUI();
    }

    private void updateUsuarios() {
        jComboBoxUsuarios.removeAllItems();
        for (int i = 0; i < usuarios.size(); i++) {
            CLASEUSUARIOS tmp = usuarios.get(i);
            jComboBoxUsuarios.addItem("" + tmp.getNombreUsuario());
        }
        jComboBoxUsuarios.updateUI();
    }

    private void updateMovimientos() {
        jComboBoxMovimientos.removeAllItems();
        for (int i = 0; i < movimientos.size(); i++) {
            CLASEMOVIMIENTOS tmp = movimientos.get(i);
            jComboBoxMovimientos.addItem("" + tmp.getFecha());
        }
        jComboBoxMovimientos.updateUI();
    }

    private void updateEstados() {
        jComboBoxEstados.removeAllItems();
        for (int i = 0; i < estados.size(); i++) {
            CLASEESTADO tmp = estados.get(i);
            jComboBoxEstados.addItem("" + tmp.getNombre());
        }
        jComboBoxEstados.updateUI();
    }

    private void updateCiudades() {
        jComboBoxCiudades.removeAllItems();
        for (int i = 0; i < ciudades.size(); i++) {
            CLASECIUDAD tmp = ciudades.get(i);
            jComboBoxCiudades.addItem("" + tmp.getNombreCiudad());
        }
        jComboBoxCiudades.updateUI();
    }

    private void updateZonas() {
        jComboBoxZonas.removeAllItems();
        for (int i = 0; i < zonas.size(); i++) {
            CLASEZONA tmp = zonas.get(i);
            jComboBoxZonas.addItem("" + tmp.getLocalizacion());
        }
        jComboBoxZonas.updateUI();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jComboBoxClientes = new javax.swing.JComboBox<>();
        Clientes = new javax.swing.JLabel();
        Empresas = new javax.swing.JLabel();
        jComboBoxEmpresas = new javax.swing.JComboBox<>();
        Servicios = new javax.swing.JLabel();
        jComboBoxServicios = new javax.swing.JComboBox<>();
        Servicios1 = new javax.swing.JLabel();
        jComboBoxComercios = new javax.swing.JComboBox<>();
        Servicios2 = new javax.swing.JLabel();
        jComboBoxEquipos = new javax.swing.JComboBox<>();
        jComboBoxUsuarios = new javax.swing.JComboBox<>();
        Servicios3 = new javax.swing.JLabel();
        Servicios4 = new javax.swing.JLabel();
        jComboBoxMovimientos = new javax.swing.JComboBox<>();
        Servicios5 = new javax.swing.JLabel();
        jComboBoxZonas = new javax.swing.JComboBox<>();
        jComboBoxCiudades = new javax.swing.JComboBox<>();
        Servicios6 = new javax.swing.JLabel();
        jComboBoxEstados = new javax.swing.JComboBox<>();
        Servicios7 = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenuClientes = new javax.swing.JMenu();
        jSeparator1 = new javax.swing.JPopupMenu.Separator();
        jSeparator2 = new javax.swing.JPopupMenu.Separator();
        jMenuEmpresa = new javax.swing.JMenu();
        jMenuServicios = new javax.swing.JMenu();
        jMenuComercios = new javax.swing.JMenu();
        jMenuEquipos = new javax.swing.JMenu();
        jMenuUsuarios = new javax.swing.JMenu();
        jMenuMovimientos = new javax.swing.JMenu();
        jMenuZona = new javax.swing.JMenu();
        jMenuCiudad = new javax.swing.JMenu();
        jMenuEstados = new javax.swing.JMenu();
        jMenuReportes = new javax.swing.JMenu();
        jSeparator3 = new javax.swing.JPopupMenu.Separator();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();
        jMenuItemLogin = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Taller de Base de Datos");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

        Clientes.setText("Clientes:");

        Empresas.setText("Empresas:");

        Servicios.setText("Servicios:");

        Servicios1.setText("Comercios:");

        Servicios2.setText("Equipos:");

        Servicios3.setText("Usuarios:");

        Servicios4.setText("Movimientos:");

        Servicios5.setText("Zonas:");

        Servicios6.setText("Ciudades:");

        Servicios7.setText("Estados:");

        jMenuClientes.setText("Clientes");
        jMenuClientes.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuClientesMenuSelected(evt);
            }
        });
        jMenuClientes.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jMenuClientesMouseClicked(evt);
            }
        });
        jMenuClientes.add(jSeparator1);
        jMenuClientes.add(jSeparator2);

        jMenuBar1.add(jMenuClientes);
        jMenuClientes.getAccessibleContext().setAccessibleDescription("");

        jMenuEmpresa.setText("Empresas");
        jMenuEmpresa.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuEmpresaMenuSelected(evt);
            }
        });
        jMenuEmpresa.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jMenuEmpresaMouseClicked(evt);
            }
        });
        jMenuBar1.add(jMenuEmpresa);

        jMenuServicios.setText("Servicios");
        jMenuServicios.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuServiciosMenuSelected(evt);
            }
        });
        jMenuBar1.add(jMenuServicios);

        jMenuComercios.setText("Comercios");
        jMenuComercios.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuComerciosMenuSelected(evt);
            }
        });
        jMenuBar1.add(jMenuComercios);

        jMenuEquipos.setText("Equipos");
        jMenuEquipos.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuEquiposMenuSelected(evt);
            }
        });
        jMenuBar1.add(jMenuEquipos);

        jMenuUsuarios.setText("Usuarios");
        jMenuUsuarios.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuUsuariosMenuSelected(evt);
            }
        });
        jMenuBar1.add(jMenuUsuarios);

        jMenuMovimientos.setText("Movimientos");
        jMenuMovimientos.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuMovimientosMenuSelected(evt);
            }
        });
        jMenuBar1.add(jMenuMovimientos);

        jMenuZona.setText("Zona");
        jMenuZona.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuZonaMenuSelected(evt);
            }
        });
        jMenuBar1.add(jMenuZona);

        jMenuCiudad.setText("Ciudad");
        jMenuCiudad.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuCiudadMenuSelected(evt);
            }
        });
        jMenuBar1.add(jMenuCiudad);

        jMenuEstados.setText("Estados");
        jMenuEstados.addMenuListener(new javax.swing.event.MenuListener() {
            public void menuCanceled(javax.swing.event.MenuEvent evt) {
            }
            public void menuDeselected(javax.swing.event.MenuEvent evt) {
            }
            public void menuSelected(javax.swing.event.MenuEvent evt) {
                jMenuEstadosMenuSelected(evt);
            }
        });
        jMenuBar1.add(jMenuEstados);

        jMenuReportes.setText("Reportes");
        jMenuReportes.add(jSeparator3);

        jMenuItem1.setText("Zonas Atendidas por una Empresa");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenuReportes.add(jMenuItem1);

        jMenuItem2.setText("Total de Clientes");
        jMenuItem2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jMenuItem2MouseClicked(evt);
            }
        });
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenuReportes.add(jMenuItem2);

        jMenuItem3.setText("Información de Contratos");
        jMenuItem3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem3ActionPerformed(evt);
            }
        });
        jMenuReportes.add(jMenuItem3);

        jMenuItem4.setText("Informacion de Equipos");
        jMenuItem4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem4ActionPerformed(evt);
            }
        });
        jMenuReportes.add(jMenuItem4);

        jMenuItemLogin.setText("Inicio de sesion por usuario");
        jMenuItemLogin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItemLoginActionPerformed(evt);
            }
        });
        jMenuReportes.add(jMenuItemLogin);

        jMenuBar1.add(jMenuReportes);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Servicios1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Servicios2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Servicios3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Empresas, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Servicios, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Clientes, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Servicios4, javax.swing.GroupLayout.DEFAULT_SIZE, 75, Short.MAX_VALUE)
                    .addComponent(Servicios5, javax.swing.GroupLayout.DEFAULT_SIZE, 75, Short.MAX_VALUE)
                    .addComponent(Servicios6, javax.swing.GroupLayout.DEFAULT_SIZE, 75, Short.MAX_VALUE)
                    .addComponent(Servicios7, javax.swing.GroupLayout.DEFAULT_SIZE, 75, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jComboBoxClientes, 0, 358, Short.MAX_VALUE)
                    .addComponent(jComboBoxEmpresas, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jComboBoxServicios, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jComboBoxComercios, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jComboBoxEquipos, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jComboBoxUsuarios, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jComboBoxMovimientos, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jComboBoxZonas, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jComboBoxCiudades, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jComboBoxEstados, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(168, 168, 168))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(39, 39, 39)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxClientes, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Clientes))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxEmpresas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Empresas))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxServicios, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Servicios))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxComercios, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Servicios1))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxEquipos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Servicios2))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxUsuarios, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Servicios3))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxMovimientos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Servicios4))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxZonas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Servicios5))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxCiudades, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Servicios6))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBoxEstados, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Servicios7))
                .addContainerGap(39, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jMenuClientesMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jMenuClientesMouseClicked
        this.setVisible(false);
        new RegCliente(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuClientesMouseClicked

    private void jMenuEmpresaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jMenuEmpresaMouseClicked

    }//GEN-LAST:event_jMenuEmpresaMouseClicked

    private void jMenuServiciosMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuServiciosMenuSelected
        this.setVisible(false);
        new RegServicios(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuServiciosMenuSelected

    private void jMenuComerciosMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuComerciosMenuSelected
        this.setVisible(false);
        new RegComercio(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuComerciosMenuSelected

    private void jMenuEquiposMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuEquiposMenuSelected
        this.setVisible(false);
        new RegEquipo(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuEquiposMenuSelected

    private void jMenuUsuariosMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuUsuariosMenuSelected
        this.setVisible(false);
        new RegUsuarios(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuUsuariosMenuSelected

    private void jMenuMovimientosMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuMovimientosMenuSelected
        this.setVisible(false);
        new RegMovimientos(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuMovimientosMenuSelected

    private void jMenuCiudadMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuCiudadMenuSelected
        this.setVisible(false);
        new RegCiudad(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuCiudadMenuSelected

    private void jMenuEstadosMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuEstadosMenuSelected
        this.setVisible(false);
        new RegEstado(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuEstadosMenuSelected

    private void jMenuZonaMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuZonaMenuSelected
        this.setVisible(false);
        new RegZona(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuZonaMenuSelected

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        this.setVisible(false);
        new ReporteZonas(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        // TODO add your handling code here:

    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenuItem4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem4ActionPerformed
        // TODO add your handling code here:
        this.setVisible(false);
        new ReporteEquipos(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuItem4ActionPerformed

    private void jMenuItem3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem3ActionPerformed
        // TODO add your handling code here:
        this.setVisible(false);
        new ReporteContratos(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuItem3ActionPerformed

    private void jMenuItemLoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItemLoginActionPerformed
        this.setVisible(false);
        new ReporteLogin(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuItemLoginActionPerformed

    private void jMenuClientesMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuClientesMenuSelected
        
    }//GEN-LAST:event_jMenuClientesMenuSelected

    private void jMenuEmpresaMenuSelected(javax.swing.event.MenuEvent evt) {//GEN-FIRST:event_jMenuEmpresaMenuSelected
        this.setVisible(false);
        new RegEmpresa(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuEmpresaMenuSelected

    public static void Logs(int tipoUsuario, int idRegistro) {

        System.out.println("tipoUsuario: "+tipoUsuario);
        System.out.println("idRegistro: "+idRegistro);
        System.out.println(getNow());
        String duracion= handler.Duracion(idRegistro);
    }

    public static java.sql.Timestamp getNow() {
        java.util.Calendar calendarHoy = Calendar.getInstance();
        java.util.Date hoy = calendarHoy.getTime();
        Timestamp hoySql = new Timestamp(hoy.getTime());
        //System.out.println("Hoy es: " + hoySql);
        String DateTime = hoySql.toString();
        
        return hoySql;
    }

    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        try {
            handler.UpdateLoginUsuario(getNow().toString());
            new Login().setVisible(true);
        } catch (ParseException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_formWindowClosed

    private void jMenuItem2MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jMenuItem2MouseClicked
        // TODO add your handling code here:
        this.setVisible(false);
        new ReporteClientes(tipoUsuario).setVisible(true);
    }//GEN-LAST:event_jMenuItem2MouseClicked


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Clientes;
    private javax.swing.JLabel Empresas;
    private javax.swing.JLabel Servicios;
    private javax.swing.JLabel Servicios1;
    private javax.swing.JLabel Servicios2;
    private javax.swing.JLabel Servicios3;
    private javax.swing.JLabel Servicios4;
    private javax.swing.JLabel Servicios5;
    private javax.swing.JLabel Servicios6;
    private javax.swing.JLabel Servicios7;
    private javax.swing.JComboBox<String> jComboBoxCiudades;
    private javax.swing.JComboBox<String> jComboBoxClientes;
    private javax.swing.JComboBox<String> jComboBoxComercios;
    private javax.swing.JComboBox<String> jComboBoxEmpresas;
    private javax.swing.JComboBox<String> jComboBoxEquipos;
    private javax.swing.JComboBox<String> jComboBoxEstados;
    private javax.swing.JComboBox<String> jComboBoxMovimientos;
    private javax.swing.JComboBox<String> jComboBoxServicios;
    private javax.swing.JComboBox<String> jComboBoxUsuarios;
    private javax.swing.JComboBox<String> jComboBoxZonas;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenu jMenuCiudad;
    private javax.swing.JMenu jMenuClientes;
    private javax.swing.JMenu jMenuComercios;
    private javax.swing.JMenu jMenuEmpresa;
    private javax.swing.JMenu jMenuEquipos;
    private javax.swing.JMenu jMenuEstados;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem jMenuItemLogin;
    private javax.swing.JMenu jMenuMovimientos;
    private javax.swing.JMenu jMenuReportes;
    private javax.swing.JMenu jMenuServicios;
    private javax.swing.JMenu jMenuUsuarios;
    private javax.swing.JMenu jMenuZona;
    private javax.swing.JPopupMenu.Separator jSeparator1;
    private javax.swing.JPopupMenu.Separator jSeparator2;
    private javax.swing.JPopupMenu.Separator jSeparator3;
    // End of variables declaration//GEN-END:variables

}
