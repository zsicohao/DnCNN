datapath = fullfile('Data','Train400');

imds = imageDatastore(datapath);
img_augmenter = imageDataAugmenter( ...
        'RandXReflection',true, ...
        'RandXScale',[0.7 1], ...
        'RandYReflection',true, ...
        'RandYScale',[0.7 1],...
        'RandRotation',[0,360]);

ds = Dataloader.ImpulseNoiseImageDatastore(imds,...
  'DataAugmentation',img_augmenter,...
  'PatchSize',50,...
  'NoiseDensity',0.05,...
  'NoiseValueRange',[0.5]);

imgs = ds.preview();
figure,montage(imgs.input);
figure,montage(imgs.response);
% figure,montage(cellfun(@(x,y)x-y,imgs.input,imgs.response,'UniformOutput',false))
