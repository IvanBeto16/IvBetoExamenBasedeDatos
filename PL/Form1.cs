﻿using ML;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PL
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            InformeJedi();
        }

        public void InformeJedi()
        {
            Informe informe = BL.MiembroOrden.InformeJedi();
            if (informe != null)
            {
                dataGridView1.DataSource = informe.Informes;
            }
        }
    }
}
