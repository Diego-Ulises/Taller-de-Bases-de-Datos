package com.layout;

import com.Serv_Inter.CLASECLIENTES;
import com.Serv_Inter.CLASEEMPRESA;
import com.Serv_Inter.CLASECOMERCIO;
import javax.swing.JOptionPane;
import com.Serv_Inter.Handler;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;

public class RegCliente extends javax.swing.JFrame {

    private ArrayList<CLASECLIENTES> clientes;
    private ArrayList<CLASEEMPRESA> empresas;
    private ArrayList<CLASECOMERCIO> comercio;
    
    private Handler handler;
    private int tipo;

    public RegCliente(int t) {
        tipo=t;
        initComponents();
        init();
        jButtonEliminar.setEnabled(true);
        handler = new Handler();
        updateArrays();
        updateClientes();
        updateEmpresas();
        updateComercioID();
        updateComercioNombre();
        this.setLocationRelativeTo(null);
    }

    private void updateArrays() {
        clientes = handler.showClientes();
        empresas = handler.showEmpresas();
        comercio = handler.showComercios();
    }

    private void updateClientes() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        model.getDataVector().removeAllElements();
        for (int i = (model.getRowCount()); i < clientes.size(); i++) {
            CLASECLIENTES tmp = clientes.get(i);
            Object[] rowData = new Object[]{tmp.getNoContrato(), tmp.getNombre(), tmp.getApellidoP(), tmp.getApellidoM(), tmp.getDireccion(), tmp.getStatus(), tmp.getIDEMPRESA(), tmp.getIDCOMERCIO(), tmp.getComercio()};
            model.addRow(rowData);
        }
        jTable1.updateUI();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        ApellidoPat = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jButtonAgregar = new javax.swing.JButton();
        ApellidoP = new javax.swing.JTextField();
        ApellidoM = new javax.swing.JTextField();
        Direccion = new javax.swing.JTextField();
        Status = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        NoContrato = new javax.swing.JTextField();
        Nombre = new javax.swing.JTextField();
        jButtonEliminar = new javax.swing.JButton();
        jComboBoxEmpresas = new javax.swing.JComboBox<>();
        Modificar = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jComboBoxID = new javax.swing.JComboBox<>();
        jComboBoxComercio = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Clientes");
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

        jLabel1.setText("NoContrato");

        jLabel2.setText("Nombre");

        ApellidoPat.setText("ApellidoP");

        jLabel4.setText("ApellidoM");

        jLabel5.setText("Direccion");

        jLabel6.setText("Status");

        jLabel7.setText("Empresa");

        jButtonAgregar.setText("Agregar");
        jButtonAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAgregarActionPerformed(evt);
            }
        });

        ApellidoP.setName("ApellidoP"); // NOI18N

        ApellidoM.setName("ApellidoM"); // NOI18N

        Direccion.setName("Direccion"); // NOI18N

        Status.setName("Status"); // NOI18N

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "NoContrato", "Nombre", "ApellidoP", "ApellidoM", "Direccion", "Status", "IDEMPRESA", "IDCOMERCIO", "Comercio"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.String.class, java.lang.Integer.class, java.lang.String.class
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

        NoContrato.setName("NoContrato"); // NOI18N

        Nombre.setName("Nombre"); // NOI18N

        jButtonEliminar.setText("Eliminar");
        jButtonEliminar.setEnabled(false);
        jButtonEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonEliminarActionPerformed(evt);
            }
        });

        jComboBoxEmpresas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBoxEmpresasActionPerformed(evt);
            }
        });

        Modificar.setText("Modificar");
        Modificar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ModificarActionPerformed(evt);
            }
        });

        jLabel3.setText("IDCOMERCIO");

        jLabel8.setText("Comercio");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addComponent(jButtonAgregar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
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
                                .addComponent(ApellidoP, javax.swing.GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE)
                                .addComponent(ApellidoM)
                                .addComponent(Direccion)
                                .addComponent(Status)
                                .addComponent(NoContrato, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE)
                                .addComponent(Nombre, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE)
                                .addComponent(jComboBoxEmpresas, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jComboBoxID, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jComboBoxComercio, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                        .addComponent(Modificar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jButtonEliminar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(jLabel3)
                    .addComponent(jLabel8))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 26, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 890, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(49, 49, 49))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 382, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel1)
                            .addComponent(NoContrato, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(Nombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(ApellidoPat)
                            .addComponent(ApellidoP, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel4)
                            .addComponent(ApellidoM, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel5)
                            .addComponent(Direccion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel6)
                            .addComponent(Status, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(jComboBoxEmpresas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel3)
                            .addComponent(jComboBoxID, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel8)
                            .addComponent(jComboBoxComercio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(29, 29, 29)
                        .addComponent(Modificar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonAgregar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonEliminar)))
                .addContainerGap(16, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAgregarActionPerformed
        try {
            String NombreEmpresa =  ((String) jComboBoxEmpresas.getSelectedItem());
             
            handler.AltaCliente(Integer.parseInt(NoContrato.getText()), Nombre.getText(), ApellidoP.getText(), ApellidoM.getText(), Direccion.getText(), Status.getText(), NombreEmpresa,Integer.parseInt(jComboBoxID.getSelectedItem().toString()), jComboBoxComercio.getSelectedItem().toString());
            handler.MovCliente(Integer.parseInt(NoContrato.getText()));
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Revise los campos", "Error al registrar", JOptionPane.ERROR_MESSAGE);
        }
        updateArrays();
        updateClientes();
    }//GEN-LAST:event_jButtonAgregarActionPerformed

    private void jButtonEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonEliminarActionPerformed
        int toDelete = jTable1.getSelectedRow();
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        int CveCliente = (int) jTable1.getValueAt(jTable1.getSelectedRow(), 0);
        handler.BajaCliente(CveCliente);
        model.removeRow(toDelete);
        updateArrays();
        updateClientes();
    }//GEN-LAST:event_jButtonEliminarActionPerformed
    private void updateEmpresas() {
        jComboBoxEmpresas.removeAllItems();
        for (int i = 0; i < empresas.size(); i++) {
            CLASEEMPRESA tmp = empresas.get(i);
            jComboBoxEmpresas.addItem("" + tmp.getNombre());
        }
        jComboBoxEmpresas.updateUI();
    }
    private void updateComercioID() {
        jComboBoxID.removeAllItems();
        for (int i = 0; i < comercio.size(); i++) {
            CLASECOMERCIO tmp = comercio.get(i);
            jComboBoxID.addItem("" + tmp.getIDCOMERCIO());
        }
        jComboBoxID.updateUI();
    }
    private void updateComercioNombre() {
        jComboBoxComercio.removeAllItems();
        for (int i = 0; i < comercio.size(); i++) {
            CLASECOMERCIO tmp = comercio.get(i);
            jComboBoxComercio.addItem("" + tmp.getNombreComercial());
        }
        jComboBoxComercio.updateUI();
    }
    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        new Principal(tipo).setVisible(true);
    }//GEN-LAST:event_formWindowClosed

    private void ModificarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ModificarActionPerformed

        try{
            handler.UpClientes(NOCONTRATO2,Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()), 
                    jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString(), jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString(), 
                    jTable1.getValueAt(jTable1.getSelectedRow(), 3).toString(), jTable1.getValueAt(jTable1.getSelectedRow(), 4).toString(), 
                    jTable1.getValueAt(jTable1.getSelectedRow(), 5).toString(), jTable1.getValueAt(jTable1.getSelectedRow(), 6).toString(),
                    Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 7).toString()),
                    jTable1.getValueAt(jTable1.getSelectedRow(), 8).toString());
            
            System.out.println(Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString()));
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 1).toString());
            System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 2).toString());
            JOptionPane.showMessageDialog(null, "Datos actualizados exitosamente");
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null, "No su pudo actualizar la información");
        }
        updateArrays();
        updateClientes();

    }//GEN-LAST:event_ModificarActionPerformed
    int NOCONTRATO2;
    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        NOCONTRATO2 = Integer.parseInt(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString());
        System.out.println(NOCONTRATO2);
    }//GEN-LAST:event_jTable1MouseClicked

    private void jComboBoxEmpresasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBoxEmpresasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBoxEmpresasActionPerformed

    public void init() {
        this.setVisible(true);
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField ApellidoM;
    private javax.swing.JTextField ApellidoP;
    private javax.swing.JLabel ApellidoPat;
    private javax.swing.JTextField Direccion;
    private javax.swing.JButton Modificar;
    private javax.swing.JTextField NoContrato;
    private javax.swing.JTextField Nombre;
    private javax.swing.JTextField Status;
    private javax.swing.JButton jButtonAgregar;
    private javax.swing.JButton jButtonEliminar;
    private javax.swing.JComboBox<String> jComboBoxComercio;
    private javax.swing.JComboBox<String> jComboBoxEmpresas;
    private javax.swing.JComboBox<String> jComboBoxID;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
