def CoreDependencyInjector
    target 'DependencyInjector' do
        # Libs bundled outside
        dependency_injector_pods
    
        target 'DependencyInjectorTests' do
            
        end
    end
end

def CoreNetworkManager
    target 'NetworkManager' do
        # Libs bundled outside
        
        target 'NetworkManagerTests' do
            
        end
    end

    target 'NetworkManagerInterface' do
        # Libs bundled outside
        
    end
end

