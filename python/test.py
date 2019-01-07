import caffe
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import glob
# Jupyter notebook和Jupyter QtConsole里面使用这个将图片显示到前端
# %matplotlib inline
caffe.set_mode_cpu()

# 这里需要对比下和/root/caffe/models/bvlc_googlenet目录下模型文件是否存在区别
model_def = '/root/MachineLearn/Dog/pb/deploy.prototxt' # 模型文件
model_weights = '/root/caffe/models/bvlc_googlenet/bvlc_googlenet_iter_5000.caffemodel' # 训练结果
model_mean_file = '/root/MachineLearn/Dog/sampleImg/dog_judge/mean.binaryproto' # 均值文件

net = caffe.Net(model_def, model_weights, caffe.TEST)  
# 均值处理
mean_blob = caffe.proto.caffe_pb2.BlobProto()
mean_blob.ParseFromString(open(model_mean_file, 'rb').read())
mean_npy = caffe.io.blobproto_to_array(mean_blob)
mu = mean_npy.mean(2).mean(2)[0]
print('mu = {}'.format(mu))

# 颜色格式处理
transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})
transformer.set_transpose('data', (2,0,1))  
transformer.set_mean('data', mu)           
transformer.set_raw_scale('data', 255)     
transformer.set_channel_swap('data', (2,1,0))
  
#mu = [ 116.2626216   129.17550814  137.46700908]

#各层输出格式
for layer_name, blob in net.blobs.iteritems():
    print(layer_name + '\t' + str(blob.data.shape))

plt.rcParams['figure.figsize'] = (10, 10)

class_map = pd.read_csv('/root/MachineLearn/Dog/sampleImg/class_map.csv', index_col=0)
print('class_map = {}'.format(class_map))

predict_dir = '/root/MachineLearn/Dog/abu' 
img_list = glob.glob(predict_dir + '/*.jpeg')
print('len—img_list: = {}'.format(len(img_list)))

error_prob = []
for img in img_list:
    image = caffe.io.load_image(img)
    transformed_image = transformer.preprocess('data', image)
    plt.imshow(image)
    plt.show()
    net.blobs['data'].data[...] = transformed_image
    output = net.forward()
    output_prob = output['prob'][0]
    print('predicted class is:{}'.format(class_map[class_map['class'] == output_prob.argmax()].name.values[0]))
	# 这里的2代表拉布拉多
    if output_prob.argmax() != 2:
        error_prob.append(img)
		
#准确率
accuary = (len(img_list) - len(error_prob))/float(len(img_list))
print('accuary: = {}'.format(accuary))

#查看分类错误的分布情况
for img in error_prob:
    try:
        image = caffe.io.load_image(img)
    except Exception:
        continue
    transformed_image = transformer.preprocess('data', image)
    plt.imshow(image)
    plt.show()
    net.blobs['data'].data[...] = transformed_image
    output = net.forward()
    output_prob = output['prob'][0]
    top_inds = output_prob.argsort()[::-1]
    for rank, ind in enumerate(top_inds, 1):
        print('probabilities rank {} label is {}'.format(rank, class_map[class_map['class'] == ind].name.values[0]))