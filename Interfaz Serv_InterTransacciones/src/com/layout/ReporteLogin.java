package com.layout;

import com.Serv_Inter.CLASEREGUSUARIO;
import com.Serv_Inter.ClaseReportAllSesiones;
import com.Serv_Inter.Handler;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;

public class ReporteLogin extends javax.swing.JFrame {
private int tipo;
private ArrayList<ClaseReportAllSesiones> allSesiones;
private ArrayList<CLASEREGUSUARIO> regusuario;
private Handler handler;



    public ReporteLogin(int t) {
        initComponents();
        init();
        this.setLocationRelativeTo(null);
        handler.showReportViewSesiones();
        tipo=t;
    }
    
    public void init() {
        this.setVisible(true);
        handler = new Handler();
        this.setLocationRelativeTo(null);
    }
    
    private void updateTable() {
        DefaultTableModel model = (DefaultTableModel) jTableSesiones.getModel();
        model.getDataVector().removeAllElements();
        for (int i = (model.getRowCount()); i < allSesiones.size(); i++) {
            ClaseReportAllSesiones tmp = allSesiones.get(i);
            String tipou="";
            if(tmp.getTipoUsuario()==1){
                tipou="Administrador";
            }else if(tmp.getTipoUsuario()==2){
                tipou="Activador";
            }else if(tmp.getTipoUsuario()==3){
                tipou="Reportes";
            }
            String duracion= handler.Duracion(tmp.getIDLOGIN());
            Object[] rowData = new Object[]{tmp.getIDLOGIN(), tmp.getNombre(), tmp.getApaterno(), tmp.getAmaterno(), tipou, tmp.getFechaIicio(), tmp.getFechaFinal(),duracion};
            model.addRow(rowData);
        }
        jTableSesiones.updateUI();
        
    }
    
    private void updateArrays() {
        regusuario = handler.showRegUsuarios();
    }
    

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButtonBuscar = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTableSesiones = new javax.swing.JTable();
        jLabel4 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Reporte Sesiones");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

        jButtonBuscar.setText("Buscar");
        jButtonBuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonBuscarActionPerformed(evt);
            }
        });

        jTableSesiones.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID LOGIN", "Nombre", "Apellido Paterno", "Apellido Materno", "Tipo de Usuario", "Fecha de Inicio", "Fecha de Final", "Duracion"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane2.setViewportView(jTableSesiones);

        jLabel4.setText("Detalle de Sesiones:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel4)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 937, Short.MAX_VALUE)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGap(0, 0, Short.MAX_VALUE)
                                .addComponent(jButtonBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 166, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addContainerGap())))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 357, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButtonBuscar)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonBuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonBuscarActionPerformed
        try{
        allSesiones = handler.showReportViewSesiones();
        updateTable();
        }catch (Exception ex) {
        allSesiones = handler.showReportViewSesiones();
        updateTable();    
        }
    }//GEN-LAST:event_jButtonBuscarActionPerformed

    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        new Principal(tipo).setVisible(true);
    }//GEN-LAST:event_formWindowClosed

    /**
     * @param args the command line arguments
     */    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButtonBuscar;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTableSesiones;
    // End of variables declaration//GEN-END:variables
}
