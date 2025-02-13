import 'package:flutter/material.dart';
import 'package:nckh_app/widgets/base_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // URL của API
  final String apiUrl = "https://api.example.com/news"; // Thay bằng URL API thật

  // Biến lưu trữ danh sách tin tức
  List<dynamic> newsData = [];
  bool isLoading = true; // Trạng thái tải dữ liệu

  @override
  void initState() {
    super.initState();
    fetchNews(); // Gọi API khi khởi tạo màn hình
  }

  // Hàm gọi API
  Future<void> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body); // Giả định API trả JSON
        setState(() {
          newsData = data['articles']; // 'articles' là key chứa danh sách tin tức
          isLoading = false; // Kết thúc tải dữ liệu
        });
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Tin tức",
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Hiển thị vòng tròn khi đang tải
          : newsData.isEmpty
              ? Center(child: Text("Không có tin tức để hiển thị"))
              : ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: newsData.length,
                  itemBuilder: (context, index) {
                    final news = newsData[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Hình ảnh bài viết
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                news['imageUrl'], // Đường dẫn ảnh từ API
                                width: 100,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => 
                                  Icon(Icons.image_not_supported, size: 100),
                              ),
                            ),
                            SizedBox(width: 10),

                            // Nội dung bài viết
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Tiêu đề bài viết
                                  Text(
                                    news['title'], // Tiêu đề từ API
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 6),

                                  // Mô tả (nếu có)
                                  if (news['description'] != null && news['description'].isNotEmpty)
                                    Text(
                                      news['description'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                  // Dòng thời gian
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 14,
                                        color: Colors.grey.shade600,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        news['timestamp'], // Thời gian từ API
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
