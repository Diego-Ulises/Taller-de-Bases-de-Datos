package com.layout;

import com.Serv_Inter.CLASEEQUIPO;
import com.Serv_Inter.CLASEMOVIMIENTOS;
import com.Serv_Inter.Handler;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class RegMovimientos extends javax.swing.JFrame {

    private ArrayList<CLASEMOVIMIENTOS> movimientos;
    private ArrayList<CLASEEQUIPO> equipos; 
    private Handler handler;
    private int tipo;
    
    public RegMovimientos(int t) {
        tipo=t;
        initComponents();
        jButton2.setEnabled(true);
        handler = new Handler();
        updateArrays();
        updateMovimientos();
        updateEquipos();
        
        this.setLocationRelativeTo(null);
    }

    private void updateArrays() {
        movimientos = handler.showMovimientos();
        equipos = handler.showEquipos();
    }
    
    private void updateMovimientos() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        model.getDataVector().removeAllElements();
        for (int i = (model.getRowCount()); i < movimientos.size(); i++) {
            CLASEMOVIMIENTOS tmp = movimientos.get(i);
            Object[] rowData = new Object[]{tmp.getIDMOVIMIENTO(), tmp.getNoSerie(), tmp.getFecha(), tmp.getDireccionMAC(), 
                tmp.getIPDHCP(), tmp.getUsuarioPPPOE(), tmp.getContrasenaPPPOE(), tmp.getDescripcion()};
            model.addRow(rowData);
        }
        jTable1.updateUI();
    }
    private void updateEquipos() {
        jComboBoxNoSerie.removeAllItems();
        for (int i = 0; i < equipos.size(); i++) {
            CLASEEQUIPO tmp = equipos.get(i);
            jComboBoxNoSerie.addItem("" + tmp.getNoSERIE());
        }
        jComboBoxNoSerie.updateUI();
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        DireccionMAC = new javax.swing.JTextField();
        IPDHCP = new javax.swing.JTextField();
        UsuarioPPPOE = new javax.swing.JTextField();
        ContrasenaPPPOE = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        IDMOVIMIENTO = new javax.swing.JTextField();
        jButton2 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        ApellidoPat = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        Fecha = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        Descripcion = new javax.swing.JTextField();
        jComboBoxNoSerie = new javax.swing.JComboBox<>();
        jButton3 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Movimientos");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

        DireccionMAC.setName("DireccionMAC"); // NOI18N

        IPDHCP.setName("IPDHCP"); // NOI18N

        UsuarioPPPOE.setName("UsuarioPPPOE"); // NOI18N

        ContrasenaPPPOE.setName("ContrasenaPPPOE"); // NOI18N

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "IDMOVIMIENTO", "NoSerie", "Fecha", "DireccionMAC", "IPDHCP", "UsuariosPPPOE", "ContrasenaPPPOE", "Descripcion"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);

        IDMOVIMIENTO.setName("IDMOVIMIENTO"); // NOI18N

        jButton2.setText("Eliminar");
        jButton2.setEnabled(false);
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jLabel1.setText("IDMOVIMIENTO:");

        jLabel2.setText("NoSerie:");

        ApellidoPat.setText("Fecha:");

        jLabel4.setText("DireccionMAC:");

        jLabel5.setText("IPDHCP:");

        jLabel6.setText("UsuarioPPPOE:");

        jLabel7.setText("ContraseñaPPPOE:");

        jButton1.setText("Agregar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        Fecha.setName("Fecha"); // NOI18N

        jLabel3.setText("Descripcion:");

        Descripcion.setName("ContrasenaPPPOE"); // NOI18N

        jButton3.setText("Modificar");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel7)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel4)
                                    .addComponent(ApellidoPat)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel1))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 50, Short.MAX_VALUE)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(Fecha, javax.swing.GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE)
                                    .addComponent(DireccionMAC)
                                    .addComponent(IPDHCP)
                                    .addComponent(UsuarioPPPOE)
                                    .addComponent(ContrasenaPPPOE)
                                    .addComponent(IDMOVIMIENTO, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE)
                                    .addComponent(jComboBoxNoSerie, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addGap(84, 84, 84)
                        .addComponent(Descripcion, javax.swing.GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE))
                    .addComponent(jButton3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(74, 74, 74)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 639, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(42, 42, 42))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 382, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel1)
                            .addComponent(IDMOVIMIENTO, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(jComboBoxNoSerie, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(ApellidoPat)
                            .addComponent(Fecha, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel4)
                            .addComponent(DireccionMAC, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel5)
                            .addComponent(IPDHCP, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel6)
                            .addComponent(UsuarioPPPOE, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(ContrasenaPPPOE, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel3)
                            .addComponent(Descripcion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(62, 62, 62)
                        .addComponent(jButton3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton2)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        int toDelete = jTable1.getSelectedRow();
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        int CveMovimiento = (int) jTable1.getValueAt(jTable1.getSelectedRow(), 0);
        handler.BajaCliente(CveMovimiento);
        model.removeRow(toDelete);
        updateArrays();
        updateMovimientos();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        try {
            int NoSerie =  Integer.parseInt((String) jComboBoxNoSerie.getSelectedItem());
            handler.AltaMovimiento(Integer.parseInt(IDMOVIMIENTO.getText()), NoSerie, Fecha.getText(), 
                    DireccionMAC.getText(), IPDHCP.getText(), UsuarioPPPOE.getText(), ContrasenaPPPOE.getText(), Descripcion.getText());
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Revise los campos", "Error al registrar", JOptionPane.ERROR_MESSAGE);
        }
        updateArrays();
        updateMovimientos();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        new Principal(tipo).setVisible(true);
    }//GEN-LAST:event_formWindowClosed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed

        try{
            handler.UpMovimientos(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()),Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString()),
                jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString(), jTable1.getValueAt(jTable1.getSelectedRow(), 3).toString(),
                jTable1.getValueAt(jTable1.getSelectedRow(), 4).toString(), jTable1.getValueAt(jTable1.getSelectedRow(), 5).toString(),
                jTable1.getValueAt(jTable1.getSelectedRow(), 6).toString(), jTable1.getValueAt(jTable1.getSelectedRow(), 7).toString());
            System.out.println(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()));
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString());
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString());
            JOptionPane.showMessageDialog(null, "Datos actualizados exitosamente");
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null, "No su pudo actualizar la información");
        }
        updateArrays();
        updateMovimientos();
    }//GEN-LAST:event_jButton3ActionPerformed

   

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel ApellidoPat;
    private javax.swing.JTextField ContrasenaPPPOE;
    private javax.swing.JTextField Descripcion;
    private javax.swing.JTextField DireccionMAC;
    private javax.swing.JTextField Fecha;
    private javax.swing.JTextField IDMOVIMIENTO;
    private javax.swing.JTextField IPDHCP;
    private javax.swing.JTextField UsuarioPPPOE;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JComboBox<String> jComboBoxNoSerie;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
