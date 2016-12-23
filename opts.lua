local M = {}

function M.parse(arg)
    local cmd = torch.CmdLine();
    cmd:text()
    cmd:text('The German Traffic Sign Recognition Benchmark: A multi-class classification ')
    cmd:text()
    cmd:text('Options:')
    cmd:option('-data',             '',             'Path to dataset')
    cmd:option('-val',              0.1,             'Percentage to use for validation set')
    cmd:option('-nEpochs',          300,            'Maximum epochs')
    cmd:option('-batchsize',        128,            'Batch size for epochs')
    cmd:option('-nThreads',         1,              'Number of dataloading threads')
    cmd:option('-manualSeed',       '0',            'Manual seed for RNG')
    cmd:option('-LR',               0.1,            'initial learning rate')
    cmd:option('-momentum',         0.9,            'momentum')
    cmd:option('-weightDecay',      1e-4,           'weight decay')
    cmd:option('-logDir',           'logs',         'log directory')
    cmd:option('-model',            '',             'Model to use for training')
    cmd:option('-verbose',          'false',        'Print stats for every batch')
    cmd:option('-p', false, 'Parallel Iterator')
    cmd:option('-imageSize', 128, 'Image Size') 
    cmd:option('-output' , 'Trail1', 'OutputFilenane')
    cmd:option('-scale', 1, 'Scaling factor')
    cmd:option('-reweight', false, 'Resample or not')
    cmd:option('-t', 'rgb', 'Color trasnform')
    cmd:option('-yuv',false, 'rgb2yuv')
    cmd:option('-hsv',false, 'rgb2hsv')
    cmd:option('-noise',false,'adds trans and rot noise')
     --[[
    -- Hint: Use this option to convert your code to use GPUs
    --]]
    -- cmd:option('-cuda',            '',             'Use cuda tensor')

    local opt = cmd:parse(arg or {})

    if opt.model == '' or not paths.filep('models/'..opt.model..'.lua') then
        cmd:error('Invalid model ' .. opt.model)
    end

    return opt
end

return M
