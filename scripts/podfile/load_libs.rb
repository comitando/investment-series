def CoreDependencyInjector
    target 'DependencyInjector' do
        # Libs bundled outside
        dependency_injector_pods
    
        target 'DependencyInjectorTests' do
            
        end
    end
end