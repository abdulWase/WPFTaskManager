using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfTaskManager.UI.ViewModels;

namespace WpfTaskManager.UI.Validators
{
    public class TaskValidator : AbstractValidator<ShellViewModel>
    {
        public TaskValidator()
        {
            RuleFor(x => x.NewTaskName)
                .NotEmpty()
                .WithMessage("Task Name is required");

            RuleFor(x => x.NewDueDate)
                .NotEmpty()
                .WithMessage("Due date is required");
        }
    }
}
