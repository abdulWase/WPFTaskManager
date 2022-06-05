using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfTaskManager.UI.Models
{
    public class TaskModel
    {
        public Guid ID { get; set; }
        public DateTime DueDate { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }
    }
}
