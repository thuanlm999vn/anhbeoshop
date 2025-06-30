<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checksheet Quản Lý Máy Tính Phòng Họp</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .computers-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            padding: 30px;
        }

        .computer-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .computer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .computer-header {
            padding: 20px;
            color: white;
            text-align: center;
            font-weight: bold;
            font-size: 1.3rem;
        }

        .computer-1 .computer-header {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
        }

        .computer-2 .computer-header {
            background: linear-gradient(135deg, #4ecdc4 0%, #44a08d 100%);
        }

        .status-indicator {
            display: inline-block;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-left: 10px;
        }

        .available {
            background: #2ecc71;
            box-shadow: 0 0 10px rgba(46, 204, 113, 0.5);
        }

        .in-use {
            background: #e74c3c;
            box-shadow: 0 0 10px rgba(231, 76, 60, 0.5);
        }

        .computer-content {
            padding: 25px;
        }

        .current-status {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            border-left: 4px solid #3498db;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #2c3e50;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus, .form-group textarea:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-right: 10px;
            margin-bottom: 10px;
        }

        .btn-borrow {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
        }

        .btn-borrow:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }

        .btn-return {
            background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
            color: white;
        }

        .btn-return:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.4);
        }

        .history {
            margin-top: 25px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }

        .history h4 {
            color: #2c3e50;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .history-icon {
            margin-right: 8px;
            font-size: 1.2rem;
        }

        .history-item {
            background: white;
            padding: 12px;
            margin-bottom: 8px;
            border-radius: 8px;
            border-left: 4px solid #3498db;
            font-size: 14px;
        }

        .datetime {
            font-size: 12px;
            color: #7f8c8d;
        }

        @media (max-width: 768px) {
            .computers-grid {
                grid-template-columns: 1fr;
                gap: 20px;
                padding: 20px;
            }
            
            .header h1 {
                font-size: 2rem;
            }
        }

        .pulse {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📱 CHECKSHEET QUẢN LÝ MÁY TÍNH</h1>
            <p>Phòng Họp - Vui lòng ghi thông tin khi mượn/trả máy</p>
        </div>

        <div class="computers-grid">
            <!-- Máy tính 1 -->
            <div class="computer-card computer-1">
                <div class="computer-header">
                    💻 MÁY TÍNH 1
                    <span class="status-indicator available" id="status1"></span>
                </div>
                <div class="computer-content">
                    <div class="current-status">
                        <strong>Trạng thái:</strong> <span id="currentStatus1">Có sẵn</span><br>
                        <span id="currentUser1"></span>
                    </div>

                    <div class="form-group">
                        <label for="name1">Họ tên người mượn:</label>
                        <input type="text" id="name1" placeholder="Nhập họ tên...">
                    </div>

                    <div class="form-group">
                        <label for="purpose1">Mục đích sử dụng:</label>
                        <input type="text" id="purpose1" placeholder="Họp, thuyết trình, demo...">
                    </div>

                    <div class="form-group">
                        <label for="notes1">Ghi chú (tùy chọn):</label>
                        <textarea id="notes1" rows="2" placeholder="Ghi chú thêm..."></textarea>
                    </div>

                    <button class="btn btn-borrow" onclick="borrowComputer(1)">🔒 MƯỢN MÁY</button>
                    <button class="btn btn-return" onclick="returnComputer(1)">✅ TRẢ MÁY</button>

                    <div class="history">
                        <h4><span class="history-icon">📋</span>Lịch sử sử dụng</h4>
                        <div id="history1"></div>
                    </div>
                </div>
            </div>

            <!-- Máy tính 2 -->
            <div class="computer-card computer-2">
                <div class="computer-header">
                    💻 MÁY TÍNH 2
                    <span class="status-indicator available" id="status2"></span>
                </div>
                <div class="computer-content">
                    <div class="current-status">
                        <strong>Trạng thái:</strong> <span id="currentStatus2">Có sẵn</span><br>
                        <span id="currentUser2"></span>
                    </div>

                    <div class="form-group">
                        <label for="name2">Họ tên người mượn:</label>
                        <input type="text" id="name2" placeholder="Nhập họ tên...">
                    </div>

                    <div class="form-group">
                        <label for="purpose2">Mục đích sử dụng:</label>
                        <input type="text" id="purpose2" placeholder="Họp, thuyết trình, demo...">
                    </div>

                    <div class="form-group">
                        <label for="notes2">Ghi chú (tùy chọn):</label>
                        <textarea id="notes2" rows="2" placeholder="Ghi chú thêm..."></textarea>
                    </div>

                    <button class="btn btn-borrow" onclick="borrowComputer(2)">🔒 MƯỢN MÁY</button>
                    <button class="btn btn-return" onclick="returnComputer(2)">✅ TRẢ MÁY</button>

                    <div class="history">
                        <h4><span class="history-icon">📋</span>Lịch sử sử dụng</h4>
                        <div id="history2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Dữ liệu máy tính (lưu trong memory)
        let computers = {
            1: {
                available: true,
                currentUser: '',
                currentPurpose: '',
                currentNotes: '',
                borrowTime: null,
                history: []
            },
            2: {
                available: true,
                currentUser: '',
                currentPurpose: '',
                currentNotes: '',
                borrowTime: null,
                history: []
            }
        };

        // Khởi tạo giao diện
        function initInterface() {
            updateStatus(1);
            updateStatus(2);
            loadHistory(1);
            loadHistory(2);
        }

        // Cập nhật trạng thái máy
        function updateStatus(computerNum) {
            const computer = computers[computerNum];
            const statusElement = document.getElementById(`currentStatus${computerNum}`);
            const statusIndicator = document.getElementById(`status${computerNum}`);
            const currentUserElement = document.getElementById(`currentUser${computerNum}`);

            if (computer.available) {
                statusElement.textContent = 'Có sẵn';
                statusElement.style.color = '#2ecc71';
                statusIndicator.className = 'status-indicator available';
                currentUserElement.textContent = '';
            } else {
                statusElement.textContent = 'Đang được sử dụng';
                statusElement.style.color = '#e74c3c';
                statusIndicator.className = 'status-indicator in-use pulse';
                
                const borrowDate = new Date(computer.borrowTime);
                currentUserElement.innerHTML = `
                    <strong>Người mượn:</strong> ${computer.currentUser}<br>
                    <strong>Mục đích:</strong> ${computer.currentPurpose}<br>
                    <strong>Thời gian mượn:</strong> ${formatDateTime(borrowDate)}
                    ${computer.currentNotes ? `<br><strong>Ghi chú:</strong> ${computer.currentNotes}` : ''}
                `;
            }
        }

        // Mượn máy tính
        function borrowComputer(computerNum) {
            const name = document.getElementById(`name${computerNum}`).value.trim();
            const purpose = document.getElementById(`purpose${computerNum}`).value.trim();
            const notes = document.getElementById(`notes${computerNum}`).value.trim();

            if (!name || !purpose) {
                alert('⚠️ Vui lòng nhập đầy đủ họ tên và mục đích sử dụng!');
                return;
            }

            if (!computers[computerNum].available) {
                alert('⚠️ Máy tính này đang được sử dụng!');
                return;
            }

            // Cập nhật trạng thái
            computers[computerNum].available = false;
            computers[computerNum].currentUser = name;
            computers[computerNum].currentPurpose = purpose;
            computers[computerNum].currentNotes = notes;
            computers[computerNum].borrowTime = Date.now();

            // Xóa form
            document.getElementById(`name${computerNum}`).value = '';
            document.getElementById(`purpose${computerNum}`).value = '';
            document.getElementById(`notes${computerNum}`).value = '';

            // Cập nhật giao diện
            updateStatus(computerNum);

            alert(`✅ Đã ghi nhận mượn máy tính ${computerNum} thành công!\nNgười mượn: ${name}\nMục đích: ${purpose}`);
        }

        // Trả máy tính
        function returnComputer(computerNum) {
            if (computers[computerNum].available) {
                alert('⚠️ Máy tính này hiện đang có sẵn!');
                return;
            }

            // Lưu vào lịch sử
            const borrowTime = new Date(computers[computerNum].borrowTime);
            const returnTime = new Date();
            const duration = Math.round((returnTime - borrowTime) / (1000 * 60)); // phút

            computers[computerNum].history.unshift({
                user: computers[computerNum].currentUser,
                purpose: computers[computerNum].currentPurpose,
                notes: computers[computerNum].currentNotes,
                borrowTime: borrowTime,
                returnTime: returnTime,
                duration: duration
            });

            // Giới hạn lịch sử (chỉ giữ 10 bản ghi gần nhất)
            if (computers[computerNum].history.length > 10) {
                computers[computerNum].history = computers[computerNum].history.slice(0, 10);
            }

            // Reset trạng thái
            computers[computerNum].available = true;
            computers[computerNum].currentUser = '';
            computers[computerNum].currentPurpose = '';
            computers[computerNum].currentNotes = '';
            computers[computerNum].borrowTime = null;

            // Cập nhật giao diện
            updateStatus(computerNum);
            loadHistory(computerNum);

            alert(`✅ Đã ghi nhận trả máy tính ${computerNum} thành công!`);
        }

        // Tải lịch sử
        function loadHistory(computerNum) {
            const historyContainer = document.getElementById(`history${computerNum}`);
            const history = computers[computerNum].history;

            if (history.length === 0) {
                historyContainer.innerHTML = '<p style="color: #7f8c8d; font-style: italic;">Chưa có lịch sử sử dụng</p>';
                return;
            }

            historyContainer.innerHTML = history.map(record => `
                <div class="history-item">
                    <strong>${record.user}</strong> - ${record.purpose}<br>
                    <div class="datetime">
                        📅 ${formatDateTime(record.borrowTime)} → ${formatDateTime(record.returnTime)} 
                        (${record.duration} phút)
                    </div>
                    ${record.notes ? `<div style="margin-top: 5px; font-style: italic;">💬 ${record.notes}</div>` : ''}
                </div>
            `).join('');
        }

        // Format ngày giờ
        function formatDateTime(date) {
            return date.toLocaleString('vi-VN', {
                day: '2-digit',
                month: '2-digit',
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
            });
        }

        // Khởi tạo khi trang load
        window.addEventListener('load', initInterface);
    </script>
</body>
</html>
