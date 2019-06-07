document.addEventListener('turbolinks:load', () => {
  if (window.location.pathname.match(RegExp('/classrooms/\\d'))) {
    window.App.classroom = window.App.cable.subscriptions.create(
      {
        channel: 'ClassroomChannel',
        classroom_id: document.getElementById('classroom-main').dataset
          .classroomId,
      },
      {
        received: data => {
          const circle = document.querySelector(
            `#user-attendance-${data.user.id} .connected-indic`
          );
          circle.classList.remove('red');
          circle.classList.remove('green');
          circle.classList.add(
            data.attendance.status === 'online' ? 'green' : 'red'
          );
        },
      }
    );
  } else {
    window.App.classroom.unsubscribe();
  }
});
