# Khái Niệm
  ResNet (Residual Network) được giới thiệu đến công chúng vào năm 2015 và thậm chí đã giành được vị trí thứ 1 trong cuộc thi ILSVRC 2015 với tỉ lệ lỗi top 5 chỉ 3.57%

  Mạng ResNet (R) là một mạng CNN được thiết kế để làm việc với hàng trăm hoặc hàng nghìn lớp chập. Một vấn đề xảy ra khi xây dựng mạng CNN với nhiều lớp chập sẽ xảy ra hiện tượng Vanishing Gradient dẫn tới quá trình học tập không tốt.
# Vanishing Gradient là gì ?
  Trước hết thì Backpropagation Algorithm là một kỹ thuật thường được sử dụng trong quá trình tranining. Ý tưởng chung của thuật toán là sẽ đi từ output layer đến input layer và tính toán gradient của cost function tương ứng cho từng parameter (weight) của mạng. Gradient Descent sau đó được sử dụng để cập nhật các parameter đó.
  
  Toàn bộ quá trình trên sẽ được lặp đi lặp lại cho tới khi mà các parameter của network được hội tụ. Thông thường chúng ta sẽ có một hyperparametr (số Epoch - số lần mà traninig set được duyệt qua một lần và weights được cập nhật)

  Tuy nhiên, trong thực tế Gradients thường sẽ có giá trị nhỏ dần khi đi xuống các layer thấp hơn. Dẫn đến kết quả là các cập nhật thực hiện bởi Gradients Descent không làm thay đổi nhiều weights của các layer đó và làm chúng không thể hội tụ và mạng sẽ không thu được kết quả tốt. Hiện tượng như vậy gọi là Vanishing Gradients.
![img](https://images.viblo.asia/full/2c64f987-0660-4f19-ba0e-caf75d6ed1c2.png)
# Kiến trúc mạng ResNet
  Cho nên giải pháp mà ResNet đưa ra là sử dụng kết nối "tắt" đồng nhất để xuyên qua một hay nhiều lớp. Một khối như vậy được gọi là một Residual Block, như trong hình sau :

![image](https://user-images.githubusercontent.com/79899020/116036431-e60c4f80-a690-11eb-97d4-3be771e534bb.png)
  
  Ở các mạng khác dữ liệu được học từ output nhưng với mạng ResNet chúng được học từ F(X) và mục đích chính của ta là làm cho F(X) gần bằng không nhất để Input bằng Output.
  
# Resnet gồm 2 khối chính là
## Identity Block (Input size == Output size)
  ![image](https://user-images.githubusercontent.com/79899020/116036589-2075ec80-a691-11eb-8422-9ae873910d07.png)
## Convolutional Block (Input size != Output size)
  ![image](https://user-images.githubusercontent.com/79899020/116036681-43a09c00-a691-11eb-8a75-7421a41112f2.png)
# Mô tả chi tiết kiến trúc mạng nơ ron ResNet:
  ![img](https://images.viblo.asia/fe5b21e5-3ad3-4419-93e0-7aa77a662bdd.png)
Zero-padding : Input với (3,3)

Stage 1 : Tích chập (Conv1) với 64 filters với shape(7,7), sử dụng stride (2,2). BatchNorm, MaxPooling (3,3).

Stage 2 : Convolutiontal block sử dụng 3 filter với size 64x64x256, f=3, s=1. Có 2 Identity blocks với filter size 64x64x256, f=3.

Stage 3 : Convolutional sử dụng 3 filter size 128x128x512, f=3,s=2. Có 3 Identity blocks với filter size 128x128x512, f=3.

Stage 4 : Convolutional sử dụng 3 filter size 256x256x1024, f=3,s=2. Có 5 Identity blocks với filter size 256x256x1024, f=3.

Stage 5 :Convolutional sử dụng 3 filter size 512x512x2048, f=3,s=2. Có 2 Identity blocks với filter size 512x512x2048, f=3.

The 2D Average Pooling : sử dụng với kích thước (2,2).

The Flatten.

Fully Connected (Dense) : sử dụng softmax activation.
# Mô hình ResNet
![image](https://user-images.githubusercontent.com/79899020/116036933-9a0dda80-a691-11eb-983d-e187ec26c022.png)













