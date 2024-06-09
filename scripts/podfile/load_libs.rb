def CoreDependencyInjector
    target 'DependencyInjector' do
        # Libs bundled outside
        dependency_injector_pods
    
        target 'DependencyInjectorTests' do
            
        end
    end
end

def CoreNetworkClient
    target 'NetworkClient' do
        # Libs bundled outside
        
        target 'NetworkClientTests' do
            
        end
    end

    target 'NetworkClientInterface' do
        # Libs bundled outside
        
    end
end

