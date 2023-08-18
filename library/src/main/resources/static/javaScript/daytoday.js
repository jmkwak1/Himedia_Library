window.addEventListener("DOMContentLoaded", function () {
    const today = new Date();
    const sevenDaysLater = new Date(today.getTime() + 7 * 24 * 60 * 60 * 1000);

    // 강의 기간 시작 날짜
    const lectureStartDateInput = document.querySelector(".lecture.start-date");
    const lectureEndDateInput = document.querySelector(".lecture.end-date");

    const lectureEndDatePicker = flatpickr(lectureEndDateInput, {
        dateFormat: "Y-m-d",
        minDate: today,
        defaultDate: sevenDaysLater,
    });

    flatpickr(lectureStartDateInput, {
        dateFormat: "Y-m-d",
        minDate: "today",
        defaultDate: today,
        onChange: function(selectedDates, dateStr) {
            lectureEndDatePicker.set("minDate", dateStr);
            lectureEndDatePicker.setDate(new Date(selectedDates[0].getTime() + 7 * 24 * 60 * 60 * 1000));
        }
    });

    // 접수 기간 시작 날짜
    const registrationStartDateInput = document.querySelector(".registration.start-date");
    const registrationEndDateInput = document.querySelector(".registration.end-date");

    const registrationEndDatePicker = flatpickr(registrationEndDateInput, {
        dateFormat: "Y-m-d",
        minDate: today,
        defaultDate: sevenDaysLater,
    });

    flatpickr(registrationStartDateInput, {
        dateFormat: "Y-m-d",
        minDate: "today",
        defaultDate: today,
        onChange: function(selectedDates, dateStr) {
            registrationEndDatePicker.set("minDate", dateStr);
            registrationEndDatePicker.setDate(new Date(selectedDates[0].getTime() + 7 * 24 * 60 * 60 * 1000));
        }
    });

    // 폼 제출
    const form = document.querySelector("form");
    form.addEventListener("submit", function (event) {
        // 폼이 제출될 때 자동으로 폼 데이터를 서버로 전송합니다.
        // 이 때 폼의 action 속성에 정의된 URL로 데이터가 전송됩니다.
    });
});
