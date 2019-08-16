package com.layout;

import com.Serv_Inter.CLASEUSUARIOS;
import com.Serv_Inter.Handler;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class RegUsuarios extends javax.swing.JFrame {

    private ArrayList<CLASEUSUARIOS> usuarios;
    private Handler handler;
    private int tipo;
    
    public RegUsuarios(int t) {
        tipo=t;
        initComponents();
        init();
        jButton2.setEnabled(true);
        handler = new Handler();
        updateArrays();
        updateUsuarios();
        this.setLocationRelativeTo(null);
    }

    private void updateArrays() {
        usuarios = handler.showUsuarios();
        
    }
    
    private void updateUsuarios() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        model.getDataVector().removeAllElements();
        for (int i = (model.getRowCount()); i < usuarios.size(); i++) {
            CLASEUSUARIOS tmp = usuarios.get(i);
            Object[] rowData = new Object[]{tmp.getIDUSUARIO(), tmp.getNombreUsuario(), tmp.getIDMOVIMIENTO()};
            model.addRow(rowData);
        }
        jTable1.updateUI();
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel2 = new javax.swing.JLabel();
        ApellidoPat = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        IDUSUARIO = new javax.swing.JTextField();
        IDMOVIMIENTO = new javax.swing.JTextField();
        NombreUsuario = new javax.swing.JTextField();
        jButton2 = new javax.swing.JButton();
        LabelIDUSUARIO = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Usuarios");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

        jLabel2.setText("NombreUsuario:");

        ApellidoPat.setText("IDMOVIMIENTO:");

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "IDUSUARIO", "NombreUsuario", "IDMOVIMIENTO"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.Integer.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jButton1.setText("Agregar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        IDUSUARIO.setName("IDUSUARIO"); // NOI18N

        IDMOVIMIENTO.setName("IDMOVIMIENTO"); // NOI18N

        NombreUsuario.setName("NombreUsuario"); // NOI18N

        jButton2.setText("Eliminar");
        jButton2.setEnabled(false);
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        LabelIDUSUARIO.setText("IDUSUARIO:");

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
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(ApellidoPat)
                            .addComponent(jLabel2)
                            .addComponent(LabelIDUSUARIO))
                        .addGap(50, 50, 50)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(IDMOVIMIENTO, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(IDUSUARIO, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(NombreUsuario, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 389, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(LabelIDUSUARIO)
                            .addComponent(IDUSUARIO, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(NombreUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(ApellidoPat)
                            .addComponent(IDMOVIMIENTO, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jButton1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton3))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 296, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        try {
            handler.AltaUsuario(Integer.parseInt(IDUSUARIO.getText()), NombreUsuario.getText(), Integer.parseInt(IDMOVIMIENTO.getText()));
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Revise los campos", "Error al registrar", JOptionPane.ERROR_MESSAGE);
        }
        updateArrays();
        updateUsuarios();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        int toDelete = jTable1.getSelectedRow();
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        int CveUsuario = (int) jTable1.getValueAt(jTable1.getSelectedRow(), 0);
        handler.BajaUsuario(CveUsuario);
        model.removeRow(toDelete);
        updateArrays();
        updateUsuarios();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        new Principal(tipo).setVisible(true);
    }//GEN-LAST:event_formWindowClosed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed

        try{
            handler.UpUsuario(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()), jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString(), Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString()));
            System.out.println(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()));
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString());
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString());
            JOptionPane.showMessageDialog(null, "Datos actualizados exitosamente");
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null, "No su pudo actualizar la información");
        }
        updateArrays();
        updateUsuarios();
    }//GEN-LAST:event_jButton3ActionPerformed
    
    public void init() {
        this.setVisible(true);
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel ApellidoPat;
    private javax.swing.JTextField IDMOVIMIENTO;
    private javax.swing.JTextField IDUSUARIO;
    private javax.swing.JLabel LabelIDUSUARIO;
    private javax.swing.JTextField NombreUsuario;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
