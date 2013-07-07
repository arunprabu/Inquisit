Clonora.Views.QuestionsShow.Title = Clonora.Views.ShowEditSubView.extend({

  showTemplate: JST['questions/show/title_show'],
  editTemplate: JST['questions/show/title_edit'],

  events: {
    "click a.btn-edit": "eventEdit",
    "click button.cancel": "eventShow",
    "submit form": "eventSubmit",
  },

  eventSubmit: function(event) {
    event.preventDefault();
    var $form = $(event.target);

    var that = this;
    this.question.save($form.serializeJSON(), {
      success: function() {
        that.renderShow();
      },
      wait: true
    });
  }

});
