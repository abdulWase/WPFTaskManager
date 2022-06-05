using Caliburn.Micro;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Data;
using WpfTaskManager.UI.Models;
using WpfTaskManager.UI.Validators;

namespace WpfTaskManager.UI.ViewModels
{
    public class ShellViewModel : Screen, IDataErrorInfo
    {



        private string _newTaskName;

        public string NewTaskName
        {
            get { return _newTaskName; }
            set
            {
                _newTaskName = value;

                NotifyOfPropertyChange(() => NewTaskName);
            }
        }
        private bool _validation;
        public bool Validation
        {
            get { return _validation; }
            set
            {
                _validation = value;
                NotifyOfPropertyChange(() => Validation);
            }
        }

        private string _currentDate;

        public string CurrentDate
        {
            get { return _currentDate; }
            set
            {
                _currentDate = value;
                NotifyOfPropertyChange(() => CurrentDate);
            }
        }
        private DateTime? _newDueDate;

        public DateTime? NewDueDate
        {
            get { return _newDueDate; }
            set
            {
                _newDueDate = value;
                NotifyOfPropertyChange(() => NewDueDate);
            }
        }

        private BindableCollection<TaskModel> _tasks;


        public BindableCollection<TaskModel> Tasks
        {
            get { return _tasks; }
            set
            {
                _tasks = value;
                NotifyOfPropertyChange(() => Tasks);
            }
        }

        private readonly TaskValidator _mainVal;
        //public BindableCollection<TaskModel> Tasks { get; set; }
        public ShellViewModel()
        {
            _mainVal = new TaskValidator();
            CurrentDate = DateTime.Today.ToString("dd/MM/yyyy");
            Tasks = new BindableCollection<TaskModel> {
            new TaskModel{ID=Guid.NewGuid(), DueDate=DateTime.Today,Name="Finish BacklogItem-B05678",Status="Completed" },
            new TaskModel{ID=Guid.NewGuid(), DueDate=DateTime.Today,Name="Finish BacklogItem-B01234",Status="Created" }
            };

        }

        public bool ValidatedForm()
        {
            bool isValid = false;
            Validation = true; // turn on validation
            NotifyOfPropertyChange(null); //refresh the properties/view

            if (Error.Length == 0)
            {
                isValid = true; //  no validation errors
            }
            else
            {
                isValid = false; // has validation Erros
            }

            return isValid;
        }

        public void RemoveTask(TaskModel child)
        {
            //var indexOFObj = Tasks.IndexOf(child);
            //Tasks[indexOFObj].Status = "Deleted";

            Tasks.Remove(child);
            //CollectionViewSource.GetDefaultView(Tasks).Refresh();
        }

        public void CompletedTask(TaskModel child)
        {
            var indexOFObj = Tasks.IndexOf(child);
            Tasks[indexOFObj].Status = "Completed";
            CollectionViewSource.GetDefaultView(Tasks).Refresh();
        }
        public void AddTask()
        {
            //var results = _mainVal.Validate(this);
            if (ValidatedForm())
                Tasks.Add(new TaskModel { ID = Guid.NewGuid(), DueDate = (DateTime)NewDueDate, Name = NewTaskName, Status = "Created" });
        }

        public string this[string columnName]
        {
            get
            {
                if (!Validation)
                {
                    return null;
                }
                var firstOrDefault = _mainVal.Validate(this).Errors.FirstOrDefault(lol => lol.PropertyName == columnName);
                if (firstOrDefault != null)
                    return _mainVal != null ? firstOrDefault.ErrorMessage : "";
                return "";
            }
        }
        public string Error
        {
            get
            {
                if (Validation)
                {
                    if (_mainVal != null)
                    {
                        FluentValidation.Results.ValidationResult results = _mainVal.Validate(this);
                        if (results != null && results.Errors.Any())
                        {
                            string errors = string.Join(Environment.NewLine, results.Errors.Select(x => x.ErrorMessage).ToArray());
                            return errors;
                        }
                    }
                }
                return string.Empty;
            }
        }
    }
}

