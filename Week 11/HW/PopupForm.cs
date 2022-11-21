using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Week11_HW_Forms
{
    public partial class PopupForm : Form
    {
        public string Message { get; set; }

        public PopupForm(string message)
        {
            InitializeComponent();
            Message = message;
        }

        private void PopupForm_Load(object sender, EventArgs e)
        {
            label1.Text = Message;
        }
    }
}
