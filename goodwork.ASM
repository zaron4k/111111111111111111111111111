include 'D:\fasn\INCLUDE\win32ax.inc'

.data
Caption db "Заголовок", 0
Text db "Сумма цифр числа: %d", 0    ; Убедитесь, что строка заканчивается нулевым байтом
buf rd 255
B dd 123  ; Трехзначное число B

.code
start:
    ; Загружаем число B в eax
    mov eax, [B]

    ; Извлекаем сотни (первая цифра)
    mov ebx, 100
    xor edx, edx        ; Очищаем edx
    div ebx             ; eax = B / 100, edx = B % 100
    mov ecx, edx        ; Сотни числа

    ; Извлекаем десятки (вторая цифра)
    mov eax, [B]       
    mov ebx, 10
    xor edx, edx        ; Очищаем edx
    div ebx             ; eax = (B % 100) / 10, edx = (B % 100) % 10
    add ecx, edx        ; Добавляем десятки к общей сумме

    ; Извлекаем единицы (третья цифра)
    add ecx, eax        ; Добавляем единицы к общей сумме

    ; Формируем строку с суммой цифр
    invoke wsprintf, addr buf, addr Text, ecx

    ; Выводим результат в MessageBox
    invoke MessageBox, 0, addr buf, addr Caption, MB_OK

    ; Завершаем программу
    invoke ExitProcess, 0  ; Завершаем программу с кодом 0

.end start
