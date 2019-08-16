package com.layout;

import com.Serv_Inter.CLASECIUDAD;
import com.Serv_Inter.CLASECOMERCIO;
import com.Serv_Inter.CLASEZONA;
import javax.swing.JOptionPane;
import com.Serv_Inter.Handler;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;

public class RegZona extends javax.swing.JFrame {

    private ArrayList<CLASEZONA> zonas;
    private ArrayList<CLASECIUDAD> ciudades;
    private ArrayList<CLASECOMERCIO> comercios;
    private Handler handler;
    private int tipo;

    public RegZona(int t) {
        tipo=t;
        initComponents();
        init();
        jButtonEliminar.setEnabled(true);
        handler = new Handler();
        updateArrays();
        updateZonas();
        updateCiudades();
        updateComercio();
        this.setLocationRelativeTo(null);
    }

    private void updateArrays() {
        zonas = handler.showZonas();
        ciudades = handler.showCiudades();
        comercios = handler.showComercios();
    }

    private void updateZonas() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        model.getDataVector().removeAllElements();
        for (int i = (model.getRowCount()); i < zonas.size(); i++) {
            CLASEZONA tmp = zonas.get(i);
            Object[] rowData = new Object[]{tmp.getIDZONA(), tmp.getLocalizacion(), tmp.getCiudad(), tmp.getIDComercio()};
            model.addRow(rowData);
        }
        jTable1.updateUI();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel2 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jButtonAgregar = new javax.swing.JButton();
        jTextFieldIdZona = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jTextFieldLocalizacion = new javax.swing.JTextField();
        jButtonEliminar = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        jComboBoxCiudad = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();
        jComboBoxComercio = new javax.swing.JComboBox<>();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Zonas");
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

        jLabel2.setText("Localizacion");

        jLabel7.setText("Id Zona");

        jButtonAgregar.setText("Agregar");
        jButtonAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAgregarActionPerformed(evt);
            }
        });

        jTextFieldIdZona.setName("jTextFieldIdZona"); // NOI18N

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Id Comercio", "Localizacion", "Ciudad", "Comercio"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jTextFieldLocalizacion.setName("jTextFieldLocalizacion"); // NOI18N

        jButtonEliminar.setText("Eliminar");
        jButtonEliminar.setEnabled(false);
        jButtonEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonEliminarActionPerformed(evt);
            }
        });

        jLabel3.setText("Ciudad");

        jLabel4.setText("Comercio");

        jButton1.setText("Modificar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jButtonEliminar, javax.swing.GroupLayout.DEFAULT_SIZE, 236, Short.MAX_VALUE)
                    .addComponent(jButtonAgregar, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel7)
                            .addComponent(jLabel2)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 55, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jTextFieldIdZona)
                            .addComponent(jTextFieldLocalizacion, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE)
                            .addComponent(jComboBoxCiudad, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jComboBoxComercio, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(32, 32, 32)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 353, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(41, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(13, 13, 13)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(jTextFieldIdZona, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(jTextFieldLocalizacion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jComboBoxCiudad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel4)
                            .addComponent(jComboBoxComercio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(231, 231, 231)
                        .addComponent(jButton1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonAgregar))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 396, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButtonEliminar)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAgregarActionPerformed
        try {
            String CIUDAD = (String) jComboBoxCiudad.getSelectedItem();
            String COMERCIO = (String) jComboBoxComercio.getSelectedItem();
            handler.AltaZona(Integer.parseInt(jTextFieldIdZona.getText()), jTextFieldLocalizacion.getText(), CIUDAD, COMERCIO);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Revise los campos", "Error al registrar", JOptionPane.ERROR_MESSAGE);
        }
        updateArrays();
        updateZonas();
    }//GEN-LAST:event_jButtonAgregarActionPerformed

    private void jButtonEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonEliminarActionPerformed
        int toDelete = jTable1.getSelectedRow();
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        int IdZona = (int) jTable1.getValueAt(jTable1.getSelectedRow(), 0);
        handler.BajaZona(IdZona);
        model.removeRow(toDelete);
        updateArrays();
        updateZonas();
    }//GEN-LAST:event_jButtonEliminarActionPerformed

    private void updateCiudades() {
        jComboBoxCiudad.removeAllItems();
        for (int i = 0; i < ciudades.size(); i++) {
            CLASECIUDAD tmp = ciudades.get(i);
            jComboBoxCiudad.addItem("" + tmp.getNombreCiudad());
        }
        jComboBoxCiudad.updateUI();
    }

    private void updateComercio() {
        jComboBoxComercio.removeAllItems();
        for (int i = 0; i < comercios.size(); i++) {
            CLASECOMERCIO tmp = comercios.get(i);
            jComboBoxComercio.addItem("" + tmp.getNombreComercial());
        }
        jComboBoxComercio.updateUI();
    }

    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        new Principal(tipo).setVisible(true);
    }//GEN-LAST:event_formWindowClosed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed

        try{
            handler.UpZona(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()), jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString(), Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString()),Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 3).toString()));
            System.out.println(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()));
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString());
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString());
            JOptionPane.showMessageDialog(null, "Datos actualizados exitosamente");
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null, "No su pudo actualizar la información");
        }
        updateArrays();
        updateZonas();
    }//GEN-LAST:event_jButton1ActionPerformed

    public void init() {
        this.setVisible(true);
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButtonAgregar;
    private javax.swing.JButton jButtonEliminar;
    private javax.swing.JComboBox<String> jComboBoxCiudad;
    private javax.swing.JComboBox<String> jComboBoxComercio;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextFieldIdZona;
    private javax.swing.JTextField jTextFieldLocalizacion;
    // End of variables declaration//GEN-END:variables
}
