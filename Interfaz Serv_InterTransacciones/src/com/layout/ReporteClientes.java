/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.layout;

import com.Serv_Inter.CLASECOMERCIO;
import com.Serv_Inter.CLASEEMPRESA;
import com.Serv_Inter.CLASEMOVIMIENTOS;
import com.Serv_Inter.CLASEZONA;
import com.Serv_Inter.ClaseReportAllClientes;
import com.Serv_Inter.Handler;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Migue
 */
public class ReporteClientes extends javax.swing.JFrame {
    
    private ArrayList<CLASEEMPRESA> empresas;
    private ArrayList<CLASEZONA> zonas;
    private ArrayList<CLASEMOVIMIENTOS> movimientos;
    private ArrayList<CLASECOMERCIO> comercios;
    private ArrayList<ClaseReportAllClientes> allClientes;
    private Handler handler;
    int cont=0;


        
    String fechaComoCadenaInicio;
    String fechaComoCadenaFinal;
        
        
        private int tipo;
    public ReporteClientes(int t) {
        tipo=t;
        this.setLocationRelativeTo(null);
        initComponents();
        init();
        
    }
    
    
    public void init() {
        this.setVisible(true);
        handler = new Handler();
        this.setLocationRelativeTo(null);
        updateArrays();
        updateEmpresas();
        jRadioButtonNingunoActionPerformed(null);
    }
    
    private void updateEmpresas() {
        jComboBoxEmpresas.removeAllItems();
        for (int i = 0; i < empresas.size(); i++) {
            CLASEEMPRESA tmp = empresas.get(i);
            jComboBoxEmpresas.addItem("" + tmp.getNombre());
        }
        jComboBoxEmpresas.updateUI();
    }
    
    private void updateArrays() {
        empresas = handler.showEmpresas();
        zonas = handler.showZonas();
        comercios = handler.showComercios();
        movimientos = handler.showMovimientos();
    }
    
    private void updateTable() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        model.getDataVector().removeAllElements();
        for (int i = (model.getRowCount()); i < allClientes.size(); i++) {
            cont = cont+1;
            ClaseReportAllClientes tmp = allClientes.get(i);
            Object[] rowData = new Object[]{tmp.getIDEMPRESA(), tmp.getNombreComercial(), tmp.getNombre(),tmp.getNombreCliente(), tmp.getApellidoP(), tmp.getApellidoM(), tmp.getFecha()};
            model.addRow(rowData);
        }
        jTable1.updateUI();
        String cad;
        cad = Integer.toString(cont);
        jTextField1.setText(cad);
        cont = 0;
    }
    
    
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jCalendar1 = new com.toedter.calendar.JCalendar();
        jMonthChooser1 = new com.toedter.calendar.JMonthChooser();
        jLocaleChooser1 = new com.toedter.components.JLocaleChooser();
        jComboBoxFiltro = new javax.swing.JComboBox();
        jComboBoxEmpresas = new javax.swing.JComboBox<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jRadioButtonNomComer = new javax.swing.JRadioButton();
        jRadioButtonNinguno = new javax.swing.JRadioButton();
        jButtonBuscarClientes = new javax.swing.JButton();
        jRadioButtonFecha = new javax.swing.JRadioButton();
        DateChooserInicio = new com.toedter.calendar.JDateChooser();
        DateChooserFinal = new com.toedter.calendar.JDateChooser();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jButtonFecha = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

        jComboBoxFiltro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBoxFiltroActionPerformed(evt);
            }
        });

        jComboBoxEmpresas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBoxEmpresasActionPerformed(evt);
            }
        });

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID Empresa", "Nombre Comercial", "Nombre Empresa", "Nombre Cliente", "Apellido Paterno", "Apellido Materno", "Fecha"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jLabel1.setText("Empresas:");

        jLabel2.setText("Detalle de Clientes:");

        jLabel7.setText("Filtrado de busqueda:");

        jRadioButtonNomComer.setText("Nombre Comercial");
        jRadioButtonNomComer.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButtonNomComerActionPerformed(evt);
            }
        });

        jRadioButtonNinguno.setSelected(true);
        jRadioButtonNinguno.setText("Ninguno");
        jRadioButtonNinguno.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButtonNingunoActionPerformed(evt);
            }
        });

        jButtonBuscarClientes.setText("Buscar Clientes");
        jButtonBuscarClientes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonBuscarClientesActionPerformed(evt);
            }
        });

        jRadioButtonFecha.setText("Fechas");
        jRadioButtonFecha.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButtonFechaActionPerformed(evt);
            }
        });

        DateChooserInicio.setDateFormatString("yyyy-MM-dd");

        DateChooserFinal.setDateFormatString("yyyy-MM-dd");

        jLabel3.setText("Fecha de inicio:");

        jLabel4.setText("Fecha final:");

        jButtonFecha.setText("Buscar por fecha");
        jButtonFecha.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonFechaActionPerformed(evt);
            }
        });

        jLabel5.setText("Número de registros seleccionados: ");

        jTextField1.setEditable(false);
        jTextField1.setFocusable(false);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(163, 163, 163)
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 68, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(124, 124, 124))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 667, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jComboBoxEmpresas, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jComboBoxFiltro, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonBuscarClientes, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel7)
                            .addComponent(jRadioButtonNomComer)
                            .addComponent(jRadioButtonNinguno)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(layout.createSequentialGroup()
                                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(jRadioButtonFecha)
                                        .addComponent(jLabel3)
                                        .addComponent(jLabel4))
                                    .addGap(161, 161, 161))
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 105, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(DateChooserFinal, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(DateChooserInicio, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                        .addGap(0, 7, Short.MAX_VALUE))
                    .addComponent(jButtonFecha, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel5)
                        .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel2)
                        .addComponent(jLabel1)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(3, 3, 3)
                        .addComponent(jComboBoxEmpresas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jRadioButtonNinguno)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jRadioButtonNomComer)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jComboBoxFiltro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonBuscarClientes)
                        .addGap(18, 18, 18)
                        .addComponent(jRadioButtonFecha)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel3)
                        .addGap(5, 5, 5)
                        .addComponent(DateChooserInicio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(20, 20, 20)
                        .addComponent(jLabel4)
                        .addGap(3, 3, 3)
                        .addComponent(DateChooserFinal, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonFecha)
                        .addContainerGap())
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jRadioButtonNomComerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButtonNomComerActionPerformed
        jRadioButtonFecha.setSelected(false);
        jRadioButtonNinguno.setSelected(false);
        jRadioButtonNomComer.setSelected(true);
        
        jComboBoxFiltro.removeAllItems();
        for (int i = 0; i < comercios.size(); i++) {
            jComboBoxFiltro.addItem(comercios.get(i).getNombreComercial());
        }
        
        
    }//GEN-LAST:event_jRadioButtonNomComerActionPerformed

    private void jRadioButtonNingunoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButtonNingunoActionPerformed
        jComboBoxFiltro.removeAllItems();
        jRadioButtonNomComer.setSelected(false);
        jRadioButtonFecha.setSelected(false);
    }//GEN-LAST:event_jRadioButtonNingunoActionPerformed

    private void jButtonBuscarClientesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonBuscarClientesActionPerformed
        
        try {
            String empresa = jComboBoxEmpresas.getSelectedItem().toString();
            String dataf = jComboBoxFiltro.getSelectedItem().toString();
            if (jRadioButtonNinguno.isSelected()) {
                
            } else if (jRadioButtonNomComer.isSelected()) {
                allClientes = handler.showRepClientesFiltroNomComer(empresa,dataf);
                updateTable();
//            } else if (jRadioButtonFecha.isSelected()) {
//////                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//////                SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd");
//////                fechaComoCadenaInicio = sdf.format(DateChooserInicio.getDate());
//////                fechaComoCadenaFinal = sdf2.format(DateChooserFinal.getDate());
////                System.out.println(DateChooserFinal.getCalendar());
////                allClientes = handler.showRepClientesFiltroFecha(fechaComoCadenaInicio,fechaComoCadenaFinal);
////                updateTable();
              }
        } catch (Exception e) {
            allClientes = handler.showRepAllClientes();
            updateTable();
        }
    }//GEN-LAST:event_jButtonBuscarClientesActionPerformed

    private void jComboBoxFiltroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBoxFiltroActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBoxFiltroActionPerformed

    private void jRadioButtonFechaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButtonFechaActionPerformed
        // TODO add your handling code here:
        jRadioButtonFecha.setSelected(true);
        jRadioButtonNinguno.setSelected(false);
        jRadioButtonNomComer.setSelected(false);
    }//GEN-LAST:event_jRadioButtonFechaActionPerformed

    private void jButtonFechaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonFechaActionPerformed
        // TODO add your handling code here:
        if (jRadioButtonFecha.isSelected()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd");
                fechaComoCadenaInicio = sdf.format(DateChooserInicio.getDate());
                fechaComoCadenaFinal = sdf2.format(DateChooserFinal.getDate());
                allClientes = handler.showRepClientesFiltroFecha(fechaComoCadenaInicio, fechaComoCadenaFinal);
                updateTable();
        }
    }//GEN-LAST:event_jButtonFechaActionPerformed

    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        new Principal(tipo).setVisible(true);
    }//GEN-LAST:event_formWindowClosed

    private void jComboBoxEmpresasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBoxEmpresasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBoxEmpresasActionPerformed

    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.toedter.calendar.JDateChooser DateChooserFinal;
    private com.toedter.calendar.JDateChooser DateChooserInicio;
    private javax.swing.JButton jButtonBuscarClientes;
    private javax.swing.JButton jButtonFecha;
    private com.toedter.calendar.JCalendar jCalendar1;
    private javax.swing.JComboBox<String> jComboBoxEmpresas;
    private javax.swing.JComboBox jComboBoxFiltro;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel7;
    private com.toedter.components.JLocaleChooser jLocaleChooser1;
    private com.toedter.calendar.JMonthChooser jMonthChooser1;
    private javax.swing.JRadioButton jRadioButtonFecha;
    private javax.swing.JRadioButton jRadioButtonNinguno;
    private javax.swing.JRadioButton jRadioButtonNomComer;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}