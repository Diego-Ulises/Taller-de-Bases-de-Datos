package com.layout;

import com.Serv_Inter.CLASECOMERCIO;
import com.Serv_Inter.CLASEEMPRESA;
import javax.swing.JOptionPane;
import com.Serv_Inter.Handler;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;

public class RegComercio extends javax.swing.JFrame {

    private ArrayList<CLASECOMERCIO> comercios;
    private ArrayList<CLASEEMPRESA> empresas;
    private Handler handler;
private int tipo;

    public RegComercio(int t) {
        tipo=t;
        initComponents();
        init();
        jButtonEliminar.setEnabled(true);
        handler = new Handler();
        updateArrays();
        updateComercios();
        updateEmpresas();
        this.setLocationRelativeTo(null);
    }

    private void updateArrays() {
        comercios = handler.showComercios();
        empresas = handler.showEmpresas();
    }

    private void updateComercios() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        model.getDataVector().removeAllElements();
        for (int i = (model.getRowCount()); i < comercios.size(); i++) {
            CLASECOMERCIO tmp = comercios.get(i);
            Object[] rowData = new Object[]{tmp.getIDCOMERCIO(), tmp.getNombreComercial(), tmp.getIdEmpresa()};
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
        jTextFieldIdComercio = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jTextFieldNombreComercial = new javax.swing.JTextField();
        jButtonEliminar = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        jComboBoxEmpresas = new javax.swing.JComboBox<>();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Comercios");
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

        jLabel2.setText("Nombre Comercial");

        jLabel7.setText("Id Comercio");

        jButtonAgregar.setText("Agregar");
        jButtonAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAgregarActionPerformed(evt);
            }
        });

        jTextFieldIdComercio.setName("jTextFieldIdComercio"); // NOI18N

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Id Comercio", "Nombre Comercial", "Id Empresa"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.Integer.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jTextFieldNombreComercial.setName("jTextFieldNombreComercial"); // NOI18N

        jButtonEliminar.setText("Eliminar");
        jButtonEliminar.setEnabled(false);
        jButtonEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonEliminarActionPerformed(evt);
            }
        });

        jLabel3.setText("Empresa");

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
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButtonEliminar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jButtonAgregar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel7)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel3))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 55, Short.MAX_VALUE)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(jTextFieldIdComercio)
                                    .addComponent(jTextFieldNombreComercial, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE)
                                    .addComponent(jComboBoxEmpresas, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                            .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 240, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(25, 25, 25))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                        .addGap(2, 2, 2)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(jTextFieldIdComercio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(jTextFieldNombreComercial, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jComboBoxEmpresas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(231, 231, 231)
                        .addComponent(jButton1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonAgregar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonEliminar)))
                .addContainerGap(14, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAgregarActionPerformed
        try {
            String NombreEmpresa = (String) jComboBoxEmpresas.getSelectedItem();
            handler.AltaComercio(Integer.parseInt(jTextFieldIdComercio.getText()), jTextFieldNombreComercial.getText(), NombreEmpresa);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Revise los campos", "Error al registrar", JOptionPane.ERROR_MESSAGE);
        }
        updateArrays();
        updateComercios();
    }//GEN-LAST:event_jButtonAgregarActionPerformed
    private void jButtonEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonEliminarActionPerformed
        int toDelete = jTable1.getSelectedRow();
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        int IdComercio = Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString());
        String comercio = jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString();
        System.out.println(IdComercio);
        System.out.println(comercio);
        handler.BajaComercio(IdComercio, comercio);
        model.removeRow(toDelete);
        updateArrays();
        updateComercios();
    }//GEN-LAST:event_jButtonEliminarActionPerformed

    private void updateEmpresas() {
        jComboBoxEmpresas.removeAllItems();
        for (int i = 0; i < empresas.size(); i++) {
            CLASEEMPRESA tmp = empresas.get(i);
            jComboBoxEmpresas.addItem("" + tmp.getNombre());
        }
        jComboBoxEmpresas.updateUI();
    }
        
    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        new Principal(tipo).setVisible(true);
    }//GEN-LAST:event_formWindowClosed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        try{
            handler.UpComercio(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()), jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString(), Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString()));
            System.out.println(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()));
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString());
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString());
            JOptionPane.showMessageDialog(null, "Datos actualizados exitosamente");
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null, "No su pudo actualizar la información");
        }
        updateArrays();
        updateComercios();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        System.out.println(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()));
        System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString());
    }//GEN-LAST:event_jTable1MouseClicked

    public void init() {
        this.setVisible(true);
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButtonAgregar;
    private javax.swing.JButton jButtonEliminar;
    private javax.swing.JComboBox<String> jComboBoxEmpresas;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextFieldIdComercio;
    private javax.swing.JTextField jTextFieldNombreComercial;
    // End of variables declaration//GEN-END:variables
}
