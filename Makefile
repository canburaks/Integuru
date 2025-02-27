.PHONY: browse analyze generate_code help

# Default Python interpreter
PYTHON = uv run python
INTEGURU = uv run integuru

# Default model for analysis
MODEL ?= o1

# Default prompt
PROMPT ?= "search for legislation"

help:
	@echo "Integuru Makefile Commands:"
	@echo "  make browse         - Open browser to record network requests"
	@echo "  make analyze        - Analyze HAR file with specified PROMPT and MODEL"
	@echo "  make generate_code  - Analyze and generate integration code with specified PROMPT and MODEL"
	@echo ""
	@echo "Options:"
	@echo "  PROMPT=\"your prompt\" - Set the prompt (default: \"search for legislation\")"
	@echo "  MODEL=\"model_name\"  - Set the model (default: o1)"
	@echo ""
	@echo "Example:"
	@echo "  make generate_code PROMPT=\"search for tax laws\" MODEL=\"gpt-4o\""

browse:
	@echo "Opening browser for recording network requests..."
	@echo "Please perform the actions you want to capture, then press Enter in the terminal."
	$(PYTHON) -c "from create_har import open_browser_and_wait; import asyncio; asyncio.run(open_browser_and_wait())"

analyze:
	@echo "Analyzing network requests with prompt: $(PROMPT)"
	$(INTEGURU) --prompt $(PROMPT) --model $(MODEL)

generate_code:
	@echo "Generating integration code with prompt: $(PROMPT)"
	$(INTEGURU) --prompt $(PROMPT) --model $(MODEL) --generate-code
